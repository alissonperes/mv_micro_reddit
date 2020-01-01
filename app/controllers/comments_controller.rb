class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment.post
    else
      redirect_to '/posts/new'
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
