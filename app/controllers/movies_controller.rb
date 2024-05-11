class MoviesController < ApplicationController
  def index
    @movies = if params[:is_showing] == '1'
                Movie.where("is_showing": true)
              elsif params[:is_showing] == '0'
                Movie.where("is_showing": false)
              else
                Movie.all
              end

    return unless params[:keyword]

    @movies = @movies.where('name LIKE? or description LIKE?',
                            "%#{params[:keyword]}%", "%#{params[:keyword]}%")
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules.all
    @array = []
    @array2 = []
  end

  def reservation
    all_count = Sheet.count
    row_count = Sheet.where(row: 'a').count
    times = all_count / row_count - 1
    @yoko = row_count - 1
    @array = []
    for x in 0..times
      @array << x * row_count
    end
    @sheets = Sheet.all.to_a
    @sheet = Sheet.all.to_a
    return unless params[:schedule_id].nil? or params[:date].nil?

    redirect_to movie_path(params[:movie_id]), status: 302
  end
end
