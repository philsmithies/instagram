class PostsController < ApplicationController

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_path
  end

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def show 
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to(post_path(@post))
  end

  private
  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
