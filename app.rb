require 'sinatra/base'
require_relative 'lib/player'
require_relative 'lib/game'

class Battle < Sinatra::Base
  enable :sessions
  @@game

  get '/' do
    erb(:index)
  end

  post '/names' do
    session[:attack?] = false
    @@game = Game.new(Player.new(params[:player_1]), Player.new(params[:player_2]))
    redirect '/play'
  end

  get '/play' do
    @game = @@game
    @message = @@game.last_action
    erb(:play)
  end

  post '/attack' do
    @@game.attack(@@game.opponent)
    @@game.switch_turn
    redirect '/game-over' if @@game.loser
    redirect '/play'
  end

  get '/game-over' do
    @loser = @@game.loser
    erb(:game_over)
  end

  run! if app_file == $0
end
