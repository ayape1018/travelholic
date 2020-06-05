class PlacesController < ApplicationController
  before_action :set_country
  before_action :set_place, only: [:show, :edit, :update, :destroy]


  def index
    @places = Place.all
  end

  def show
  end

  def create
    @place = Place.new(place_params.merge(country_id: params[:country_id]))
    # @place = Place.new(place_params)
    if @place.save
      redirect_to country_path(@country)
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
    if @place.update(place_params.merge(country_id: params[:country_id]))
    # if @place.update(place_params)
      redirect_to country_place_path(@country, @place)
    else
      render 'edit'
    end
  end

  def destroy
    @place.destroy
    redirect_to country_path(@country)
  end

  private
  def set_place
    @place = Place.find(params[:id])
  end

  def set_country
    @country = Country.find(params[:country_id])
  end

  def place_params
    params[:place].permit(
      :name,
      :address,
      :telephone,
      :url,
      :image,
      :remove_image,
      :country_id,
      :user_id,
      :status
    )
  end

end
