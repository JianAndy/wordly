class CheckWordController < ApplicationController
    WORD_SYMBOLS = [:word1, :word2, :word3, :word4, :word5, :word6]

    def index
        @words = words
        @submitted_words_count = submitted_words_count
        @submitted_word_symbols = WORD_SYMBOLS.take(submitted_words_count)
        @next_word_symbol = WORD_SYMBOLS[submitted_words_count]
        @debug_me = ''
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
end
