class MathQuestion
#pass in name for current_player
  def create_question
    @first_num = rand(1..20)
    @second_num = rand(1..20)
    @correct_answer = @first_num + @second_num
  end

  #current_player is a just a string of the name
  def ask_user_question(current_player)
    puts "#{current_player}: What does #{@first_num} plus #{@second_num} equal?"
  end

  #returns true or false
  def answered_correctly?
    player_answer = gets.chomp.to_i
    @correct_answer === player_answer
  end

  def end_of_turn(player1_score, player2_score)
    puts "P1:#{player1_score}/3 vs P2:#{player2_score}/3"
    puts "-----NEW Turn-----"
  end

end