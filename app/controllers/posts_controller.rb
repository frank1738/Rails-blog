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
    post_params = params.require(:post).permit(:title, :text)
    @post = Post.new(title: post_params[:title], text: post_params[:text], comments_counter: 4, likes_counter: 9,
                     author_id: current_user.id)

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_posts_path(current_user.id)
        else
          flash[:error] = 'Post could not be saved'
          render :new, locals: { post: @post }
        end
      end
    end
  end
end
