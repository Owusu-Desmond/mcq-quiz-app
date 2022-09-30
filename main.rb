require_relative 'question'

q1 = "Which of the following is a data type in Ruby?\n(a) String\n(b) Float\n(c) All of the above\n"
q2 = "Which of the following is not a programming language?\n(a) C++\n(b) B#\n(c) R"
q3 = "Is ruby on rails a web development framework or not\n(a) True\n(b) False\n(c) None"

questions = [
  Question.new(q1, 'c'),
  Question.new(q2, 'b'),
  Question.new(q3, 'a')
]

def run_quiz(questions)
  score = 0
  questions.each do |que|
    puts que.prompt
    answer = gets.chomp.strip
    while answer != 'a' && answer != 'b' && answer != 'c'
      puts 'The answer you provide does not match any of the choices'
      puts que.prompt
      answer = gets.chomp.strip
    end
    score += 1 if answer == que.answer
  end
  puts "You got #{score} out of #{questions.length}"
end

def play_again(questions)
  puts 'Do you want to play again? (y/n)'
  answer = gets.strip.downcase
  while answer != 'y' && answer != 'n'
    puts 'The answer you provide does not match any of the choices'
    puts 'Do you want to play again? (y/n)'
    answer = gets.chomp.strip
  end
  if answer == 'y'
    run_quiz(questions)
    play_again
  end
end

run_quiz(questions)
play_again(questions)
