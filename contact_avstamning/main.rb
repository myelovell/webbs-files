require_relative './lib/slim-template.rb'

# 1: Hämta alla data ifrån 'data/user_data.csv'
lines = File.readlines('data/user_data.csv')

# 2: Gör om datastrukturen till en ny dubbelarray
# double_array = ... 



# 3: Skapa ännu en ny array som innehåller 1 dictionary/anställd
# array_with_hashes = ...





# 4: I denna hash lägger du arrayen du skapade i #3
 data_hash = {

 }
 
# 5: Skapa SLIM-kod i slim-filerna

# 6: Här skapas html mha slim. Dictionaryn 'data_hash' skickas med
html = slim(:index, locals: data_hash) #:index är namnet på slim-fil. datahash är en dictionary vi skickar.


# Don't touch ;)
File.write("index.html",html)