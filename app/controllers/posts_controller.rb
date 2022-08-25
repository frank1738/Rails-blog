class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.likes_counter = 0
    @post.comments_counter = 0
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_posts_path(current_user.id)
        else
          puts @post.errors.full_messages
          flash[:error] = 'Post could not be saved'
          render :new, locals: { post: @post }
        end
      end
    end
  end

  def destroy
    @author = User.find(params[:user_id])
    @post = @author.posts.find(params[:id])
    @post.destroy
    if @post.destroy
      redirect_to user_path(params[:user_id])
    else
      redirect_to user_posts_path(params[:user_id], params[:id])
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
