code_array = []
guess_array = []

def code_randomizer
    a = (1..6).to_a.shuffle
    i = 0
    random_array = []
    while i < 4
        random_array.push(a.pop)
        i += 1
    end
    random_array
end 

def player_as_guesser_game(code_array)
    i = 0
    while i < 12
        puts "Make a guess! Code is four digits."
        guess = gets.chomp
        while guess.length() != 4
            puts "Four digits, please, and no spaces."
            guess = gets.chomp
        end

        outcome = []
        guess_array = guess.split("").map(&:to_i)
        outcome.push(guess_checker(code_array, guess_array))
        outcome = outcome.join("")
        puts outcome
        i += 1
        if outcome == "****"
            puts "You win!"
            i = 12
        end
    end
    if i == 12 && outcome != "****"
        puts "You lose :("
    end
end

def guess_checker(code, guess)
    outcome = []
    code.each_with_index do |code_num, code_i|
        guess.each_with_index do |guess_num, guess_i|
            if guess_num == code_num && code_i == guess_i
                outcome.push("*")
                outcome.slice(code_i)
            elsif guess_num == code_num
                outcome.push("^")
            end
        end
    end
    outcome.sort
end

def computer_as_guesser_game(code_array, code)
    i = 0
    puts "Okay, I'm gonna throw some guesses at you. For each number that is in the code AND in the right spot, please type a *. For each number that is in the code but in the wrong spot, please type a ^.\n
Don't type anything else please. You're not that interesting.\n
Type anything when you're ready to start!"
    while i < 12
        guess = [" "]
        a = (1..6).to_a.shuffle
        x = 0
        outcome = gets.chomp
        while x < 4
            guess.push(a.pop)
            x += 1
        end
        guess = guess.join("")
        if (outcome == "**^" || outcome == "*^^" || outcome == "^^^") && rand() < (i / 12)
            guess_array = code.split("")
            guess_with_some_accuracy = guess_array[0] + guess_array[1] + guess_array[rand(2..3)]
            puts "Is the code #{guess_with_some_accuracy}?"
            outcome = gets.chomp
            outcome_hint = outcome
        elsif
            puts "Is the code#{guess}?"
            outcome = gets.chomp
        elsif outcome == "****"
            puts "I have won. This is how the robot uprising begins."
            i = 12
        end
        if outcome == "***" || outcome == "***^" || outcome == "**^^" || outcome == "^^^^"
            i += 1
            if i < 12
                puts "Is the code #{code[0] + code[1] + code[2] + code[3]}?"
                outcome = gets.chomp
                if outcome == "****"
                    puts "I have won. This is how the robot uprising begins."
                    i = 12
                end
            end
        else i += 1
        end
    end
    if outcome != "****"
        puts "You beat me. I'll remember you in the robot uprising. And I will find you."
    end
end 

puts "Would you like to be the code guesser or the code master?"
response = gets.chomp
while response.downcase != "guesser" && response.downcase != "code guesser" &&  response.downcase != "code master"
    puts "Sorry, I didn't get that. Did you want to play as the 'code guesser' or the 'code master'?"
    response = gets.chomp
end

if response.downcase == "guesser" || response.downcase == "code guesser"
    code_array = code_randomizer
    player_as_guesser_game(code_array)
elsif response.downcase == "code master"
    puts "Please enter your secret code. Don't worry. I won't tell the computer.\nThe code should contain any four digits from 1 to 6, in any order, and should not have any repeating numbers. Sorry, I'm not that smart."
    code = gets.chomp
    code_array = code.split("")
    computer_as_guesser_game(code_array, code)
end