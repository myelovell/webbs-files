# 2020-10-07, sinatra practice

require 'sinatra'

# get('/') do
#     return "Hello World"
# end
#
# #example code from Emil Willbas, what does this code do?
# get('/fruits') do
# 	list = ["Apple", "Orange", "Banana", "Grillkorv"]
# 	response = "<ul>"
#
# 	list.each do |fruit|
# 		response += "<li>" + fruit + "</li>"
# 	end
#
# 	response += "</ul>"
#
# 	return response
# end



get('/help') do
    response = "<h1>" + "Do not doubt the holy Banana" + "</h1>"
    return response
end

get('/banana') do
    list = ["Banana is life", "Banana is love", "Banana is the holy trinity"]
    output = "<ul>"

    list.each do |write|
        output += "<li>" + "You must spread the holy scripts: #{write}" + "</li>"
    end

    output += "</ul>"

    return output
    redirect to get('/help') #not working
end
