# 1: Hämta alla data ifrån 'data/user_data.csv'
# 2: Gör om datastrukturen till en ny dubbelarray
# 3: Skapa ännu en ny array som innehåller 1 dictionary/anställd
# 4: I denna hash lägger du arrayen du skapade i #3
require_relative './lib/slim-template.rb'

lines = File.readlines('data/user_data.csv')
# p lines
double_array = lines.map do |user|
    user.split(",")
    user.chomp #removes newline
end
# array_with_hashes = ...
double_array.each do |element|
    data_hash = {
        id_num: element[0],
        name: element[1],
        email: element[2],
        user_data: element[3],
        department: element[4]
    }
end

 data_hash = {
    emlpoyer: double_array
 }
# 5: Skapa SLIM-kod i slim-filerna

# 6: Här skapas html mha slim. Dictionaryn 'data_hash' skickas med
html = slim(:index, locals: data_hash) #:index är namnet på slim-fil. datahash är en dictionary vi skickar.


# Don't touch ;)
File.write("index.html",html)
