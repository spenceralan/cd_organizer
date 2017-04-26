require 'sinatra'
require 'sinatra/reloader'
require './lib/organizer'
require 'pry'

enable :sessions

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
  cd = Collection.find_cd(params.fetch('id'))
  @message = "#{cd.title}, by #{cd.artist}"
  @id = cd.id
  erb(:edit)
end

get('/edit-cd') do
  cd = Collection.find_cd(params.fetch('id'))
  cd.update_attribute("title", params.fetch('title'))
  cd.update_attribute("artist", params.fetch('artist'))
  erb(:index)
end

get('/delete-cd') do
  cd = Collection.find_cd(params.fetch('id'))
  Collection.delete_cd(cd.id)
  erb(:index)
end

get('/search-artist') do
  artist_search = params.fetch('artist-search')
  @albums_by_artist = Collection.find_artist(artist_search)
  erb(:index)
end
