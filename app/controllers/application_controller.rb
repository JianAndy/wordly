class ApplicationController < ActionController::Base
    helper_method :time_till_next_game

    
    protected 
   def destroy_game_session
       [:word1, :word2, :word3, :word4, :word5, :word6].each do | n |
            session[n] = nil
        end
    end

   
    def time_till_next_game
        total_seconds = ((Date.today + 1).to_time - Time.now).ceil
        total_minutes, seconds = total_seconds.divmod(60)
        hours, minutes = total_minutes.divmod(60)
        "#{hours}:#{minutes}:#{seconds}  " +Date.tomorrow.strftime("%F")
    end
    
end
