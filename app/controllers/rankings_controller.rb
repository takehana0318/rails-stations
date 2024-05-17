class RankingsController < ApplicationController
  def index
    @rankings = {}
    today = Date.today
    rankings = Ranking.where(rank_name: today).all
    rankings.each do |ranking|
      @rankings[ranking.movie_id] = ranking.count
    end
  end
end
