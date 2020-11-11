require 'sinatra/base'

class Battle < Sinatra::Base
  get "/" do
    erb :index
  end

  enable :sessions

  post '/names' do
    session[:players_names] = [params[:name1], params[:name2]]
    redirect "/play"
  end

  get '/play' do
    @name1 = session[:players_names][0]
    @name2 = session[:players_names][1]
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
