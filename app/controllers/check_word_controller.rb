class CheckWordController < ApplicationController
    def index
    end

    def check_words
        @words = params
     end
end
