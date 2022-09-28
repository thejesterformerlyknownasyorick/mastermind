code_array = []

def code_randomizer_easy
    a = (1..6).to_a.shuffle
    i = 0
    random_array = []
    while i < 4
        random_array.push(a.pop)
        i += 1
    end
    random_array
end 


def code_randomizer_hard
    i = 0
    random_array = []
    while i < 4
        random_array.push(rand(1..6))
        i += 1
    end
    random_array
end

difficulty_choice = "Easy: Code will be a random sequence of four non-repeating numbers between 1 and 6.\n
Hard: Code will be a random sequence of numbers between 1 and 6, with possible repeated number.\n
Pick a difficulty: Easy, Hard"

puts difficulty_choice
difficulty = gets.chomp
unless difficulty.downcase == "easy" || difficulty.downcase == "hard"
    puts "You only had two choices. How did you screw that up? Try again."
    difficulty = gets.chomp
end
if difficulty.downcase == "easy"
    code_array = code_randomizer_easy
elsif difficulty.downcase == "hard"
    code_array = code_randomizer_hard
end
p code_array