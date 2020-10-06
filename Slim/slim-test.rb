require_relative './lib/slim-template.rb'

variables = {
    name:"Hello Wordld"

}


html = slim( :test, locals: variables)

File.write("index.html",html)


# Senare i kursen (med Sinatra):
# get('/') do
#     slim( :index )
# end
