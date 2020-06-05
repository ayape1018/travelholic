class PostsController < ApplicationController
  before_action :set_country
  before_action :set_place
  before_action :set_post, only: [:show, :edit, :update, :destroy]


  def index
    @posts = Post.all
  end

  def show
  end

  def create
    # @post = Post.new(post_params)
    @post = Post.new(post_params.merge(place_id: params[:place_id]))
    if @post.save
      redirect_to country_place_path(@country, @place)
    else
      render 'new'
    end
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def update
    if @post.update(post_params.merge(place_id: params[:place_id]))
    # if @post.update(post_params)
      redirect_to country_place_post_path(@country, @place, @post)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to country_place_path(@country, @place)
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def set_place
    @place = Place.find(params[:place_id])
  end

  def set_country
    @country = Country.find(params[:country_id])
  end

  def post_params
    params[:post].permit(
      :title,
      :body,
      {images: []},
      :remove_images,
      :_destroy,
      :place_id,
      :user_id,
      :status
    )
  end
end
