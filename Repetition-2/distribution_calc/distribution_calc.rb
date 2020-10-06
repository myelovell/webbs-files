#2020-09-02, read lines and colculate procentage of category distrubution

catalog = File.readlines("foods.txt") #outputs with \n

#Fruit
#Vegetable
#Beverage

index1 = 0 #element index
index2 = 0 #character in element index

fruits = 0
vegetables = 0
beverages = 0
category = ""

while index1 < catalog.length
    while index2 < catalog[index1].length
        if catalog[index1][index2] == " "
            for index in catalog[index1][index2]...catalog[index1].length
            category += catalog[index1][index2]
            end
            if category == "#Fruit"
                fruits += 1
            elsif category == "#Vegetable"
                vegetables += 1
            elsif category == "#Beverage"
                beverages += 1
            end
        end
        index2 += 1
    end
    index1 += 1
end

return "Total: #{catalog.length - 1}
Fruits: #{fruits/(catalog.length - 1) * 100}%
Vegetables: #{vegetables/(catalog.length - 1) * 100}%
Beverages: #{beverages/(catalog.length - 1) * 100}%"
