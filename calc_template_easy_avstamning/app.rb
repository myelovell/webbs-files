# 1. Kontrolleraa att slim, sinatra och sessions kan avändas i denna fil. Mappstruktur ok? Slimfiler ok?
# 2. Hämta upp värdena ifrån formuläret, gör dem till datatyp float.
# 3. Beroende på operator (+,-,*,-) lägg rätt resultat i output.
# 4. Lägg output i en session
# 5 redirecta till GET
# 6. Visa upp historiken (output) i calculator.slim. Lös mha session (ej locals).
# 7. Lägg till funktionalitet för att tömma historiken.
# 8. Felhantering (1: Slimresultat om session är tom?, 2: Värdet "0" används i division).
require 'sinatra'
require 'slim'
enable :sessions

output=[]

get('/') do
    slim(:calculator)
end

post('/calculate') do
    num1 = params[:num1].to_f
    num2 = params[:num2].to_f
    operator = params[:operator]

    p "Har fått in #{num1}, #{num2} och #{operator}"

case operator
    when  "+"
        output << "#{num1} + #{num2} = #{num1 + num2}"
    when "-"
        output << "#{num1} - #{num2} = #{num1 - num2}"
    when  "*"
        output << "#{num1} * #{num2} = #{num1 * num2}"
    when "/"
        if  num2 == 0
            redirect to('/error')
        else
            output << "#{num1} + #{num2} = #{num1 / num2}"
        end

end
session[:history] = output #session med keyn history och valuen output
    redirect to('/')
end

get('/error') do
    slim(:error)
end

post('/Clear') do
    session.destroy
    output = []
    redirect to('/')
end
