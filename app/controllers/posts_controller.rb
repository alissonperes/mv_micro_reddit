class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 8)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
