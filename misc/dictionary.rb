#2020-09-16, dictionary about myself

personal_dictionary = {
    first_name: "My",
    middle_name: "Elisabeth Eklundh",
    last_name: "Eklundh Lovell",
    age: 17,
    interest: "pets",
    pets: "dog and cats",
    favourite_vehicle: "jeep pickup truck",
    phone_number: "none of yo bizniz"
}

p personal_dictionary[:first_name]

personal_dictionary += (family_members: ["Anna", "Love", "Pelle", "Felicia", "Chihiro", "Jazz", "Peter", "Phoebe"]






    def add(*lst_of_lsts):
        return [
            [sum(values) for values in zip(*rows)]
            for rows in zip(*lst_of_lsts)
        ]

def add(list_of_values)
    all_values = 0
    for i in 0...list_of_values.length - 1
        for j in list_of_values[i].lenght - 1
            all_values << list_of_values[i][j]
        end
    end
end

def add(list_of_values)
    all_values = list_of_values.map do |i|
        for each.list_of_values[i] do |j|
        << list_of_values[i][j]
        end
    end
end

def add(list_of_values)
    all_values = 0
    for i in 0...list_of_values.length - 1
        all_values += list_of_values[i]
    end
end

def add(list_of_values)
    return sum.list_of_values
end
