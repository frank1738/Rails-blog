class LikesController < ApplicationController
  def new
    @like = Like.new(post_id: params[:post_id], author_id: current_user.id)
  end

  def create
    like_params = params.require(:like).permit(:post_id)
    @like = Like.new(post_id: like_params[:post_id], author_id: current_user.id)
    respond_to do |format|
      format.html do
        if @like.save
          flash[:success] = 'Like was successfully created.'
          redirect_to user_post_path(current_user.id, params[:post_id])
        else
          render :new, locals: { like: @like }
        end
      end
    end
  end
end
