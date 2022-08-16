class ApplicationController < ActionController::Base
    
    protected 
   def destroy_game_session
       [:word1, :word2, :word3, :word4, :word5, :word6].each do | n |
            session[n] = nil
        end
    end
end
