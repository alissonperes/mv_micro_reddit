class PostsController < ApplicationController
  def index
    @posts = Post.paginate(page: params[:page], per_page: 8)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    if logged_in?
      @post = Post.new
    else
      flash[:danger] = 'Login first!'
      redirect_to posts_path
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
