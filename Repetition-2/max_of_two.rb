#2020-09-01, Greater of two

def max_of_two(num1, num2)
    while num1 == 0
        puts "Argument 1: error: do not enter 0 or letters, enter valid input"
        num1 = gets.to_int
    end

    while num1 == 0
        puts "Argument 2: error: do not enter 0 or letters, enter valid input"
        num2 = gets.to_int
    end

    if num1 > num2
        return num1
    else
        return num2
    end
end
