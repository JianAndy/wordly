class User < ApplicationRecord
    has_many :games

    validates :username, presence: true, length: { minimum: 2 }


    def self.personal_stats(id)
        @games = Game.where(user_id: id)

        if @games.empty?
            ["No game stats"]
        elsif 

            ### calculating strokes -BEGINING
            status_array = [] 

            @games.each do |game|
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
            streak_stats = {
            :max => streak_stats.max , 
            :last => streak_stats.last
            }
            ### calculating strokes -END

            @games_count = @games.length
            @games_won =  @games.where(status: true)
            @win_ratio =  (@games_won.length * 100) / @games_count
            

        {
            "Played" => @games_count,
            "Win %" => @win_ratio,
            "Current Streak" => streak_stats[:last],
            "Max streak" => streak_stats[:max],
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
