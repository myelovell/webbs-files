#2020-09-09, for loops

#uppgift 1
new_list = []
namnlista = File.readlines("namnlista.txt")

new_list = namnlista.map do |i| #taught version
    split_name = i.split(" ")
    first_name = split_name[0]
    last_name = split_name[1]
    last_name + " " + fisrt_name
end


for i in 0...namnista.length - 1 #my version
    for j in 0...namnlista[i].length - 1
        split_name = i.split(" ")
        first_name = split_name[0]
        last_name = split_name[1]
        new_list << last_name + " " + fisrt_name
    end
end

#uppgift 2


#uppgift 3
