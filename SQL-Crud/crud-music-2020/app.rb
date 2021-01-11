require 'sinatra'
require 'slim'
require 'sqlite3'
#1. 
# - Kontrollera gems (sinatra, slim, sqlite). Kommer du behöva sessions? Troligen ej, ska endast utföra CRUD på databasen.
# - Se hur Slimfiler är organierade i mappstrukturen. Följer det REST? Hur kallar man på en slimfil i en mapp?

#2. Starta upp applikationen och inspektera koden i Chrome (högerklick>inspect). Hur ser länkarna ut? Finns de som routes i app.rb?

#3. När vi klickar på ett album vill vi även se artisten (inte bara id). Gör ett andra anrop till db och skicka med i locals.

#4. Skapa en sida där vi lägger till nya album för tex Artisten ACDC (ArtistId 1). Hitta gärna på nya namn på skivorna

#5. Skapa funktionalitet för att ta bort album

#6. Skapa funktionalitet för att uppdatera artistinformation


get('/')  do
  slim(:start)
end 

get('/albums') do
  db = SQLite3::Database.new("db/chinook-crud.db")
  db.results_as_hash = true
  result = db.execute("SELECT * FROM albums")
  p result
  slim(:"albums/index",locals:{albums:result})
end

get('/new') do 
  slim(:"albums/new")
end

post('/add') do 
  name = params[:name]
  artistId = params[:artistId].to_i
  db = SQLite3::Database.new("db/chinook-crud.db")
  db.results_as_hash = true
  db.execute("INSERT INTO albums (Title, ArtistId) VALUES ('#{name}', '#{artistId}')")
  redirect to('/albums')
end

get('/delete/:id') do
  id = params[:id].to_i
  db = SQLite3::Database.new("db/chinook-crud.db")
  db.results_as_hash = true
  db.execute("DELETE FROM albums WHERE AlbumId = '#{id}'")
  redirect to('/albums')
end

get('/albums/:id') do
  id = params[:id].to_i
  db = SQLite3::Database.new("db/chinook-crud.db")
  db.results_as_hash = true
  album = db.execute("SELECT * FROM albums WHERE AlbumId = ?",id).first
  p album
  p album["ArtistId"]
  name = db.execute("SELECT Name FROM artists WHERE ArtistId IN (SELECT ArtistId FROM albums WHERE AlbumId = ?)", id).first
  p name
  slim(:"albums/show",locals:{result:album, name:name})
end

post('/albums/:id/update') do
  id = params[:id].to_i
  title = params[:title]
  artistId = params[:artistId].to_i 
  db = SQLite3::Database.new("db/chinook-crud.db")
  db.execute("UPDATE albums SET Title=?, ArtistId=? WHERE AlbumId = ?", title, artistId, id)
  redirect('/albums')
end

get('/albums/:id/edit') do
  id = params[:id].to_i
  db = SQLite3::Database.new("db/chinook-crud.db")
  db.results_as_hash = true
  result = db.execute("SELECT * FROM albums WHERE AlbumId = ?", id).first
  slim(:"/albums/edit", locals:{result:result})
end