class GamesController < ApplicationController
    def index
        @user_games = Game.where(user_id: session[:user_id])
        redirect_to check_word_path
    end




end
