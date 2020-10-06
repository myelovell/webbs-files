#Uppgift 2:
#Skriv ett skript som läser in words.txt och sparar ner en ny fil fast med alla ord som har exakt tre tecken i sig. Använd select.


def pick_three()
  words = File.readlines("words.txt")
  #puts words
  newArray = []
  newArray = words.select do |item|
    p item
    chomped_item = item.chomp
    p chomped_item
    chomped_item.length == 3
  end
  File.write("newtext.txt",newArray.join())
end

pick_three()

def myFunc()
  list = [1,2,3]
  list.each do |el|
    puts el*2
  end
end

#myFunc()