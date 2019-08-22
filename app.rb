require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base
  enable :sessions

  $game

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:attack?] = false
    $game = Game.new(Player.new(params[:player_1]), Player.new(params[:player_2]))
    redirect '/play'
  end

  get '/play' do
    @attack = session[:attack?]
    @player_1 = $game.player_1
    @player_2 = $game.player_2
    erb(:play)
  end

  post '/attack' do
    @player_1 = $game.player_1
    @player_2 = $game.player_2
    $game.attack(@player_2)
    session[:attack?] = true
    redirect '/play'
  end

  run! if app_file == $0
end
