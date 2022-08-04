class WordlyController < ApplicationController
  def index
    @time_till_next_game = time_till_next_game
  end

  def time_till_next_game
    total_seconds = (Date.tomorrow.to_time - Time.now).ceil
    total_minutes, seconds = total_seconds.divmod(60)
    hours, minutes = total_minutes.divmod(60)
    "#{hours}:#{minutes}:#{seconds}"
  end
end
