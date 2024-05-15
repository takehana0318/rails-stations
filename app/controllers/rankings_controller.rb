class RankingsController < ApplicationController
  def index
    @rankings = {}
    rankings = Ranking.all
    rankings.each do |ranking|
      @rankings[ranking.movie_id] = ranking.count
    end
  end
end
