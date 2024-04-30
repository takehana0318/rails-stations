class MoviesController < ApplicationController
  def index
    if params[:is_showing] == "1" then
      @movies = Movie.where("is_showing": true)
    elsif params[:is_showing] == "0" then
      @movies = Movie.where("is_showing": false)
    else
      @movies = Movie.all
    end

    if params[:keyword]
      @movies = @movies.where("name LIKE? or description LIKE?", 
                              "%#{params[:keyword]}%", "%#{params[:keyword]}%")
    end

  end
end
