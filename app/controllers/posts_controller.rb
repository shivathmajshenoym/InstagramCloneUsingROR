class PostsController < ApplicationController
  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.user_id=current_user.id
  end

  if @post.valid?
    @post.save 
  else 
    render :new, status: :unprocessable_entity
  end

  private 

  def post_params
    params.require(:post).permit(:body)
  end

end
