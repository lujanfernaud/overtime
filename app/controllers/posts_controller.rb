class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
    authorize @post
  end

  def create
    @post = Post.new(post_params_with_current_user)

    if @post.save
      redirect_to post_path(@post), notice: "Post created successfully."
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Post updated."
    else
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path, notice: "The post was deleted."
  end

  private

    def find_post
      @post = Post.find(params[:id])
    end

    def post_params_with_current_user
      post_params.merge(user_id: current_user.id)
    end

    def post_params
      params.require(:post).permit(:date, :rationale, :status)
    end
end
