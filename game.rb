require './player.rb'
require './turn_manager.rb'
require './mathQuestion.rb'

class Game
  def initialize
    @player1 = Player.new('Player1')
    @player2 = Player.new('Player2')

    @players = [@player1, @player2]
    @turn_manager = TurnManager.new(@players)
    @math_question = MathQuestion.new
  end

  def play
    while not game_over?

      current_player = @turn_manager.current_player
      @math_question.create_question
      @math_question.ask_user_question(current_player.name)
      if (@math_question.answered_correctly?)
        puts "#{current_player.name}: YES! You are corect."
      else
        puts "#{current_player.name}: Seriously? No!"
        current_player.decrease_score
      end
      @math_question.end_of_turn(@player1.current_lives, @player2.current_lives)
      current_player = @turn_manager.next_player
    end

    if (@player1.current_lives > @player2.current_lives)
      puts "#{@player1.name} wins with a score of #{@player1.current_lives}/3"
    else
      puts "#{@player2.name} wins with a score of #{@player2.current_lives}/3"
    end


    puts "-----GAME OVER-----"
    puts "Good bye!"
  end

  def game_over?
    @players.any? { |p| p.dead? }
  end

end