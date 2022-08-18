class GamesController < ApplicationController
    def index
        @games = games 
        @personal_stats = personal_stats
        #redirect_to games_path        

    end

    def games 
        Game.where(user_id: session[:user_id])
    end 

    def strokes(games)
        status_array = [] 

        games.each do |game|
            status_array.append(game.status)
        end 

        groups_of_true_statuses = []
        n = 0 

        status_array.each do |status|
           if status == true 
            groups_of_true_statuses[n] = 0 if groups_of_true_statuses[n].nil?
            groups_of_true_statuses[n] +=1 
           elsif 
            n += 1 
           end
        end 
        
        streak_stats = groups_of_true_statuses.compact
         
        {
        :max => streak_stats.max , 
        :last => streak_stats.last
        }
    end 

    def personal_stats

        if @games.empty?
            "No game stats"
        elsif 
            @games_count = @games.length
            @games_won =  Game.where(user_id: session[:user_id], status: true)
            @win_ratio =  (@games_won.length * 100) / @games_count

            @strokes = strokes(@games)

        {
            "Played" => @games_count,
            "Win %" => @win_ratio,
            "Current Streak" => @strokes[:last],
            "Max streak" => @strokes[:max],
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
