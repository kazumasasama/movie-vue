class MoviesController < ApplicationController
  
  def index
    movies = Movie.all
    render json: movies.as_json
  end

  def create
    movie = Movie.new(
      title: params[:title],
      director: params[:director],
      year: params[:year],
      plot: params[:plot],
      image: params[:image]
    )
    if movie.save
      render json: movie.as_json
    else
      render json: {error: movie.errors.full_messages}, status: 422
    end
  end
end