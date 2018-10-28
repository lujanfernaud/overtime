class PostsController < ApplicationController
  def index
  end

  def show
    @post = set_post
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save!
      redirect_to post_path(@post), notice: "Post created successfully."
    else
      render :new
    end
  end

  private

    def set_post
      Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:date, :rationale)
    end
end
