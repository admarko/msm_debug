class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  #READ
  def show
    @movie = Movie.find(params["id"])
    render("movies/show.html.erb")
  end


  #CREATE
  def new_form
    render("movies/new_form.html.erb")
  end

  def create_row
    @movie = Movie.new
    @movie.title = params[:the_title]
    @movie.year = params[:the_year]
    @movie.duration = params[:the_duration]
    @movie.description = params[:the_description]
    @movie.image_url = params[:the_image_url]
    @movie.director_id = params[:director_id]
    @movie.save

    redirect_to("http://localhost:3000/movies")
  end


  #UPDATE
  def edit_form
    @movie = Movie.find(params[:id])
    render("movies/edit_form.html.erb")
  end

  def update_row
    @movie = Movie.find(params["id"])
    @id = params["id"]
    @title = params[:title]
    @year = params[:year]
    @duration = params[:duration]
    @description = params[:description]
    @image_url = params[:image_url]
    @director_id = params[:director_id]

    @movie = Movie.find(params["id"])
    @movie.title = @title
    @movie.year = @year
    @movie.duration = @duration
    @movie.description = @description
    @movie.image_url = @image_url
    @movie.director_id = @director_id
    @movie.save

    render("movies/show.html.erb")
  end

  #DELETE
  def destroy
    @movie = Movie.find(params[:id]).destroy
    render("movies/destroy.html.erb")
  end
end
