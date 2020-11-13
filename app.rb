require 'sinatra/base'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

class Battle < Sinatra::Base
  get "/" do
    erb :index
  end

  enable :sessions

  get '/play' do
    erb :play
  end

  post '/names' do
    $game = Game.new(Player.new(params[:name1]), Player.new(params[:name2]))
    redirect "/play"
  end

  post '/attack' do
    $game.attack($game.player2)
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
