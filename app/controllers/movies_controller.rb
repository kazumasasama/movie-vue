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
      render json: {errors: movie.errors.full_messages}, status: 422
    end
  end

  def update
    movie = Movie.find(params[:id])
    movie.title = params[:title] || movie.title
    movie.year = params[:year] || movie.year
    movie.director = params[:director] || movie.director
    movie.plot = params[:plot] || movie.plot
    movie.image = params[:image] || movie.image
    if movie.save
      render json: movie.as_json
    else
      render json: {errors: movie.errors.full_messages}, status: 422
    end
  end
end