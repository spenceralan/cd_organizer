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
  session[:cd_id] = params.fetch('id')
  cd = Collection.find_cd(params.fetch('id'))
  @message = "#{cd.title}, by #{cd.artist}"
  @id = cd.id
  erb(:edit)
end

get('/edit-cd') do
  @message = "Successfully updated!"
  cd = Collection.find_cd(session[:cd_id])
  cd.update_attribute("title", params.fetch('title'))
  cd.update_attribute("artist", params.fetch('artist'))
  erb(:index)
end

get('/delete-cd') do
  @message = "Successfully deleted!"
  cd = Collection.find_cd(session[:cd_id])
  Collection.delete_cd(cd.id)
  erb(:index)
end

get('/search-artist') do
  artist_search = params.fetch('artist-search')
  @albums_by_artist = Collection.find_artist(artist_search)
  erb(:index)
end
