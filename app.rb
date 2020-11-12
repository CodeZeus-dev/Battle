require 'sinatra/base'
require_relative './lib/player.rb'

class Battle < Sinatra::Base
  get "/" do
    erb :index
  end

  enable :sessions

  get '/play' do
    $player1 = Player.new(session[:players_names][0])
    $player2 = Player.new(session[:players_names][1])
    erb :play
  end

  post '/names' do
    session[:players_names] = [params[:name1], params[:name2]]
    redirect "/play"
  end

  post'/attack' do
    $player1.attack($player2)
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
