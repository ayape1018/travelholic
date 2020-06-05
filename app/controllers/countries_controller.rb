class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]

  def index
    @countries = Country.all
  end

  def show
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to area_path(@country.area)
    else
      render 'new'
    end
  end

  def new
    @country = Country.new
  end

  def edit
  end

  def update
    if @country.update(country_params)
      redirect_to area_path(@country.area)
    else
      render 'edit'
    end
  end

  def destroy
    @country.destroy
    redirect_to root_path
  end

  private
  def set_country
    @country = Country.find(params[:id])
  end

  def country_params
    params[:country].permit(
      :name,
      :area_id
    )
  end

end
