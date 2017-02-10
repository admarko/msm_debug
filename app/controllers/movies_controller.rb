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
    @movie.director_id = params[:the_director_id]
    @movie.save

    render("movies/show/#{@movie.id}")
  end




  #UPDATE
  def edit_form
    @movie = Movie.find(params[:id])
  end

  def update_row
    @movie.title = params[:title]
    @movie.year = params[:year]
    @movie.duration = params[:duration]
    @movie.description = params[:description]
    @movie.image_url = params[:image_url]
    @movie.director_id = params[:director_id]

    render("show")
  end

  #DELETE
  def destroy
    @movie = Movie.find(params[:id]).destroy
    render("movies/destroy.html.erb")
  end
end
