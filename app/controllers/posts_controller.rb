class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = set_post
  end

  def new
    @post = Post.new
  end

  def edit
    @post = set_post
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post), notice: "Post created successfully."
    else
      render :new
    end
  end

  def update
    @post = set_post

    if @post.update(post_params)
      redirect_to posts_path, notice: "Post updated."
    else
      render :edit
    end
  end

  def destroy
    @post = set_post

    @post.destroy

    redirect_to posts_path, notice: "The post was deleted."
  end

  private

    def set_post
      Post.find(params[:id])
    end

    def post_params
      params.require(:post)
            .permit(:date, :rationale)
            .merge(user_id: current_user.id)
    end
end
