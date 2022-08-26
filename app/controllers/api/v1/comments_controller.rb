class Api::V1::CommentsController < ApplicationController
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments, status: :ok
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user = current_user

    if @comment.save
      render json: { status: 201, message: 'Comment creation success!', content: { comment: @comment } }
    else
      render json: @comment.errors, status: :bad_request, message: 'Failed!'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
