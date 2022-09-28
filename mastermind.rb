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

def game(code_array)
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

code_array = code_randomizer

game(code_array)