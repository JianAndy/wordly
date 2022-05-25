class CheckWordController < ApplicationController
    def index
        @words = words
    end

    private
    def words
        {:word1 => params["word1"] || "",
        :word2 => params["word2"] || "",  
        :word3 => params["word3"] || "",
        :word4 => params["word4"] || "",
        :word5 => params["word5"] || "",
        :word6 => params["word6"] || ""}
    end
end
