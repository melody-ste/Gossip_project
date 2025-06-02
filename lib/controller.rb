require_relative 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
  erb :new_gossip
  end

  post '/gossips/new/' do
  Gossip.new(params["gossip_author"], params["gossip_content"]).save #enregistre les infos dans le .csv
  redirect '/' 
  end

  get '/gossips/:id/' do
  @gossip = Gossip.find(params['id'])
  erb :show
  end

  get '/gossips/:id/edit/' do
  @gossip = Gossip.find(params['id'])
  @id = params['id']
  erb :edit
  end

  post '/gossips/:id/edit/' do
  Gossip.update(params['id'], params['author'], params['content'])
  redirect '/'
  end

end

