class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  
  def index
    @posts = current_user.posts
  end

  def show
  end
  
  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path
    else
      render :edit
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end


  def destroy
    @post.destroy
    redirect_to post_path
  end

      private

      def set_post
        @post = current_user.posts.find(params[:id])
      end

      def post_params
        params.require(:post).permit(:title, :body)
      end
end
