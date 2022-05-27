class CheckWordController < ApplicationController
    WORD_SYMBOLS = [:word1, :word2, :word3, :word4, :word5, :word6]
    
    def index
        @words = words
        @submitted_words_count = submitted_words_count
        @submitted_word_symbols = WORD_SYMBOLS.take(submitted_words_count)
        @next_word_symbol = WORD_SYMBOLS[submitted_words_count]
        @debug_me = word_of_the_day
        @word_of_the_day = word_of_the_day
        @check_word = check_word
    end

    private

    def submitted_words_count
      words.select { |_, v| v != '' }.count
    end

    def words
        {:word1 => params["word1"] || "",
        :word2 => params["word2"] || "",
        :word3 => params["word3"] || "",
        :word4 => params["word4"] || "",
        :word5 => params["word5"] || "",
        :word6 => params["word6"] || ""}
    end

    def check_word
        if @words[@submitted_word_symbols.last()] ==  nil
            'GUESS THE WORD'
        elsif @words[@submitted_word_symbols.last()] ==  word_of_the_day
            'YOU WON'
        elsif @submitted_word_symbols.last() == :word6 && @words[@submitted_word_symbols.last()] !=  word_of_the_day
            'LOSER'
        else
           'GUESS ANOTHER WORD'
        end
    end

    def word_of_the_day
        file = File.open("#{Rails.root}/words/words.txt")
        file_data = file.readlines.map(&:chomp)
        the_word = file_data[(Time.new.year.to_s[2,3]).to_i + Date.today.yday()*25]

        file.close

        the_word
    end 



end
