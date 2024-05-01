class Admin::MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end

    def new
        @movie = Movie.new
    end

    def show
        @movie = Movie.find_by(id: [params[:id]])
    end

    def create
        @movie = Movie.new(movie_params)
        if @movie.save
            redirect_to admin_movies_path
        else
            flash.now[:notice] = "Failed to Post"
            redirect_to new_admin_movie_path
        end
    end

    def edit
        @movie = Movie.find_by(id: [params[:id]])
    end

    def update
        @movie = Movie.find_by(id: [params[:id]])
        if @movie.save
            redirect_to admin_movies_path
        else
            flash.now[:notice] = "Failed to Post"
            redirect_to edit_admin_movie_path
        end 
    end

    def destroy
        @movie = Movie.find_by(id: [params[:id]])
        begin
            @movie.destroy
            flash[:success] = "Success to delete"
            redirect_to admin_movies_path
        rescue => e
            raise ActiveRecord::RecordNotFound
        end
    end

    private

    def movie_params
        params.require(:movie).permit(:name, :year, :description, :image_url, :is_showing)
    end
end
