class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
    render("actors/show.html.erb")
  end

  def new_form
    render("actors/new_form.html.erb")
  end

  def create_row
    @actor = Actor.new
    @actor.dob = params[:dob]
    @actor.name = params[:name]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]

    @actor.save

    redirect_to("http://localhost:3000/actors")
  end

  def edit_form
    @actor = Actor.find(params[:id])
    render("actors/edit_form.html.erb")
  end

  def update_row
    @id = params["id"]
    @dob = params[:dob]
    @name = params[:name]
    @bio = params[:bio]
    @image_url = params[:image_url]

    @actor = Actor.find(params[:id])
    @actor.name = @name
    @actor.dob = @dob
    @actor.bio = @bio
    @actor.image_url = @image_url
    @actor.save

    redirect_to("http://localhost:3000/actors/#{@id}")
  end



  def destroy
    @actor = Actor.find(params[:id])
    @actor.destroy
  end
end
