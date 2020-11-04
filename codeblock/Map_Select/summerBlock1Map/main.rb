#Uppgift 1:  
#Skriv ett script som läser in names.txt och sparar ner en ny fil fast med efternamnet först, sen förnamnet.Använd map.

def switch2

  names = File.readlines('names.txt')

  p names


  reverse_names = names.map do |name|
    splitted = name.split(" ") #Gör om varje sträng till en array ["Emil","Willbas"," "]
    puts "Splitted: #{splitted}"
    fname = splitted[0] #Plocka ut förnamn
    lname = splitted[1] #Plocka ut efternamn
    lname + " " + fname #Returnera varje name med detta konkatinerade innehåll

  end

  p reverse_names

  File.write("rev_names2.txt",reverse_names.join("\n"))#Gör om hela array till sträng med "\n" som separation

end


switch2()
