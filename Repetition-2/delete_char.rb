#2020-09-01, delete x in arr

def delete_char(str, char)
    while !str.is_a?(String)
        puts "Argument str: error: argument is not a string, input string"
        str = gets.chomp
    end

    while char.length != 1
        puts "Argument char: error: enter only 1 variable"
        char = gets.chomp
    end

    arr = []
    for index in 0...str.length - 1
        arr << str[index]
    end
    index = 0
    new_str = []

    while index < arr.length
        if arr[i] != char
            new_str.concat(arr[index].to_s)
        end
        i += 1
    end
    return new_str
end
