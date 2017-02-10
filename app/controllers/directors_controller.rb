class DirectorsController < ApplicationController
  def index
    @director = Director.all
  end

  def show
    @director = Director.find(params[:id])
    render("directors/show.html.erb")
  end

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

    render("directors/show/#{@director.id}")
  end

  def edit_form
    @director = Director.find(params[:id])
  end

  def update_row
    @director = Director.find(params[:id])

    @director.dob = params[":dob"]
    @director.name = params[":name"]
    @director.bio = params[":bio"]
    @director.image_url = params[":image_url"]

    @director.save

    render("directors/show/details#{@director.id}")
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy
    render("directors/destroy.html.erb")
  end
end
