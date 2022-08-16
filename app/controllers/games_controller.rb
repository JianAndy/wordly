class GamesController < ApplicationController
    def index
        @games = games 
        @personal_stats = personal_stats
        #redirect_to games_path

    end

    def games 
        Game.where(user_id: session[:user_id])
    end 

    def personal_stats

        if @games.empty?
            "No game stats"
        elsif 
            @games_count = @games.length
            @games_won =  Game.where(user_id: session[:user_id], status: true)
            @win_ratio =  (@games_won.length * 100) / @games_count

        {
            "Played" => @games_count,
            "Win %" => @win_ratio,
            "Current Streak" => '',
            "Max streak" => '' , 
            "Row Distribution" => {
                1 => @games_won.where(row: 1).length,
                2 => @games_won.where(row: 2).length,
                3 => @games_won.where(row: 3).length,
                4 => @games_won.where(row: 4).length,
                5 => @games_won.where(row: 5).length,
                6 => @games_won.where(row: 6).length
            }
        }
    
        end

        
    end




end
