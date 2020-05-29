class PlacesController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.all
  end

  def show
  end

  def create
    @place = Place.new(place_params)
    binding.pry
    if @place.save
      redirect_to places_path
    else
      render 'new'
    end
  end

  def new
    @place = Place.new
  end

  def edit
  end

  def update
    if @place.update(place_params)
      redirect_to place_path(@place)
    else
      render 'edit'
    end
  end

  def destroy
    @place.destroy
    redirect_to places_path
  end

  private
    def set_work
      @place = Place.find(params[:id])
    end

    def place_params
      params[:place].permit(:name, :address, :telephone, :url, :image, :remove_image, :country_id, :user_id)
    end


end
