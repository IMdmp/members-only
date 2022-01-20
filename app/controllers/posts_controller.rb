class PostsController < ApplicationController
before_action :authenticate_user!, only: [:new, :create]
  
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
        redirect_to action: :index
    else
    end

  end

  def index
    @posts = current_user.posts
  end

  private
  def post_params
    params.require(:post).permit(:title,:body)
  end

end

