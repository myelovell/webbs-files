require 'sinatra'
require 'slim'
require 'sqlite3'
require 'bcrypt'

#1. Skapa ER + databas som kan hålla användare och todos. Fota ER-diagram,
#   lägg i misc-mapp

#4. Låt inloggad användare skapa todos i ett formulär (på en ny sida ELLER på sidan som visar todos.).
#5. Låt inloggad användare updatera och ta bort sina formulär.
#6. Lägg till felhantering (meddelande om man skriver in fel user/lösen)

enable :sessions

get('/') do
  slim(:register)
end

get('/showlogin') do
  slim(:login)
end

post('/login') do
    username = params[:username]
    password = params[:password]
    db = SQLite3::Database.new('db/todo2021.db')
    db.results_as_hash = true
    result = db.execute("SELECT * FROM users WHERE username = ?",username).first
    pwdigest = result["pwdigest"]
    id = result["id"]

    if BCrypt::Password.new(pwdigest) == password
        session[:id] = id
        redirect('/todos')
    else
        "Incorrect username or password, please try again."
    end
end

post('/users/new') do
    username = params[:username]
    password = params[:password]
    password_confirm = params[:password_confirm]

    if (password == password_confirm)
        #add user
        password_digest = BCrypt::Password.create(password)
        db = SQLite3::Database.new('db/todo2021.db')
        db.execute("INSERT INTO users (username,pwdigest) VALUES (?,?)",username,password_digest)
        redirect('/')
    else
        #felhantering
        "Password did not match!"
    end
end

get('/todos') do
    user_id = session[:user_id].to_i
    username = session[:username]
    db = SQLite3::Database.new('db/todo2021.db')
    db.results_as_hash = true

    result = db.execute("SELECT * FROM todos WHERE user_id = ?",user_id)
    slim(:"todos/index",locals:{todos:result})

end

get('/todos/new') do
    slim(:'todos/new')
end

post('/todos/new') do
    content = params[:content]
    user_id = session[:user_id].to_i
    db = SQLite3::Database.new('db/todo2021.db')

    db.execute("INSERT INTO todos (content, user_id) VALUES (?,?)",content, user_id)
    redirect("/todos")
end

post("/todos/:content_id/update") do
    db =SQLite3::Database.new("db/todo2021.db")

    content_id = params[:content_id].to_i
    content = params[:content]

    db.execute("UPDATE todos SET content=? WHERE content_id=?",content, content_id)
    redirect("/todos")
end

get("/todos/:content_id/edit") do
    db = SQLite3::Database.new("db/todo2021.db")
    db.results_as_hash = true
    content_id = params[:content_id].to_i

    result = db.execute("SELECT * FROM todos WHERE content_id = ?",content_id).first
    slim(:"/todos/edit", locals:{result:result})
end

post("/todos/:content_id/delete") do
    db = SQLite3::Database.new("db/todo2021.db")
    content_id = params[:content_id].to_i

    db.execute("DELETE FROM todos WHERE content_id = ?", content_id)
    redirect("/todos")
end
