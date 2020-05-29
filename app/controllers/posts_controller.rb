class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_place

  def index
    @posts = Post.all
  end

  def show
  end

  def create
    @post = Post.new(post_params.merge(place_id: params[:place_id]))
    if @post.save
      redirect_to place_posts_path(@place)
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
      redirect_to place_post_path(@place, @post)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to place_posts_path(@place)
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def set_place
    @place = Place.find(params[:place_id])
  end

  def post_params
    params[:post].permit(
      :title,
      :body,
      {images: []},
      :remove_images,
      :_destroy,
      :user_id,
      :status,
    )
  end
end
