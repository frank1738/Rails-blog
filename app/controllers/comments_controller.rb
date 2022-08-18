class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(post_params)
    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Comment was successfully created.'
          redirect_to user_post_path(current_user.id, params[:post_id])
        else
          render :new, locals: { comment: @comment }
        end
      end
    end
  end

  private

  def post_params
    params.require(:comment).permit(:text)
  end
end
