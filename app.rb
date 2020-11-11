require 'sinatra/base'

class Battle < Sinatra::Base
  get "/" do
    erb :index
  end

  enable :sessions

  post '/names' do
    @name1 = params[:name1]
    @name2 = params[:name2]
    session[:players_names] = [@name1, @name2]
    redirect "/names?name1=#{@name1}&name2=#{@name2}"
  end

  get '/names' do
    @name1 = session[:players_names][0]
    @name2 = session[:players_names][1]
    erb :play
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
