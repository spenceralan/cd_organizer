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

get("/edit-page/") do
  erb(:edit)
end

get("/edit-cd/:object") do
  i = Collection.all_cds.index_of(params.fetch("object"))
  @cd = Collection.all_cds[i]
  erb(:edit)
end



get('/edit-cd') do

  erb(:index)
end
