require 'sinatra'
require 'sinatra/reloader'
require './lib/organizer'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  @message = "Add a CD!"
  erb(:index)
end

get('/add-cd') do
  @message = "Successfully added! Add another!"
  title = params.fetch('title')
  artist = params.fetch('artist')
  new_cd = CD.new(title, artist)
  my_cds = Collection.new
  my_cds.add_cd(new_cd)
  erb(:index)
end

get("/edit-page/:id") do
  cd = Collection.find_cd(params.fetch('id').to_i)
  @message = "#{cd.title}, by #{cd.artist}"
  @id = cd.id
  erb(:edit)
end

get('/edit-cd') do
  cd = Collection.find_cd(params.fetch('id').to_i)
  cd.update_attribute("title", params.fetch('title'))
  cd.update_attribute("artist", params.fetch('artist'))
  erb(:index)
end
