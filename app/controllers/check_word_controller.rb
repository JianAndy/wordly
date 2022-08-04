class CheckWordController < ApplicationController
    helper_method :check_word_colouring
    WORD_SYMBOLS = [:word1, :word2, :word3, :word4, :word5, :word6]
    
    def index
        @words = words
        @submitted_words_count = submitted_words_count
        @submitted_word_symbols = WORD_SYMBOLS.take(submitted_words_count)
        @next_word_symbol = WORD_SYMBOLS[submitted_words_count]
        @debug_me = word_of_the_day
        @word_of_the_day = word_of_the_day
        @check_word = check_word
        @alphabet = alphabet     
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
        if last_submitted_word[:word] ==  nil
            "GUESS THE WORD"
        elsif last_submitted_word[:word].upcase ==  word_of_the_day
            "YOU WON"
        elsif last_submitted_word[:word_nr] == :word6 && last_submitted_word[:word] !=  word_of_the_day
            "TRY ANOTHER DAY"
        else
           "GUESS ANOTHER WORD"
        end
    end

    def alphabet
        ('A'..'Z').to_h { |letter| [letter, ""] }
    end

    def check_word_colouring (correct_word, guess_word)
        
        colours = Array.new

        guess_word.each_char.each_with_index do |letter, index|
            letter.upcase!
            if letter == correct_word[index]
                colour = '#ccfecf;'
                @alphabet[letter] = colour
            elsif correct_word.include?(letter)
                colour = '#fef9cc;'
                (@alphabet[letter] = colour) unless @alphabet[letter] == '#ccfecf;'
            else
                colour = '#ddd;'
                @alphabet[letter] = colour
            end

           colours.append(colour)
        end

        colours

        ## '#ccfecf' -> green  '#fef9cc' -> yellow  '#ddd' ->  grey
    end

    def last_submitted_word
        {
            :word_nr => @submitted_word_symbols.last ,
            :word => @words[@submitted_word_symbols.last]
        }
    end 

    def word_of_the_day
        file = File.open("#{Rails.root}/words/words.txt")
        file_data = file.readlines.map { |line| line.strip }
        the_word = file_data[Time.new.year % 100 + Date.today.yday()*25]
        
        file.close

        the_word.upcase!
    end 

end
