class PlayersController < ApplicationController
    #index listas
    #show get 
    #new initialize
    #create post

  def index
    @players = Player.online.order(:up_time)
  end
end
