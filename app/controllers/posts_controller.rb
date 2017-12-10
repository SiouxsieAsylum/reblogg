class PostsController < ApplicationController
  before_action :ensure_signed_in
  # before_action :load_post, [:show, :edit, :update, :destroy]

  def index
    @posts = current_user.posts
    @followers = Followship.where(follower_id: current_user.id)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = 'Posted!'
      redirect_to posts_path
    else
      flash[:error] = @post.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update
      flash[:notice] = 'Updated!'
      redirect_to post_path
    else
      flash[:error] = @post.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @post.destroy!

    flash[:notice] = "post deleted!"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end

  # def load_post
  #   @post = current_user.posts.find(params[:id])
  # end

end
