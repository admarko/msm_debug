class DirectorsController < ApplicationController
  def index
    @list_of_directors = Director.all
  end

  #READ
  def show
    @director = Director.find(params[:id])
    render("directors/show.html.erb")
  end

  #CREATE
  def new_form
    render("directors/new_form.html.erb")
  end

  def create_row
    @director = Director.new
    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    @director.save

    redirect_to("http://localhost:3000/directors")
  end

  #UPDATE
  def edit_form
    @director = Director.find(params[:id])
    render("edit_form.html.erb")
  end

  def update_row
    @id = params["id"]
    @dob = params[:the_dob]
    @name = params[:the_name]
    @bio = params[:the_bio]
    @image_url = params[:the_image_url]

    @director = Director.find(@id)
    @director.dob = @dob
    @director.name = @name
    @director.bio = @bio
    @director.image_url = @image_url
    @director.save

    render("directors/show.html.erb")
  end

  #DELETE
  def destroy
    @director = Director.find(params[:id])

    @director.destroy
    render("directors/destroy.html.erb")
  end
end
