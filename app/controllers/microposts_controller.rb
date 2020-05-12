# frozen_string_literal: true

class MicropostsController < ApplicationController
  def index
    @microposts = Post.find(params[:post_id])
  end

  def show
    post = Post.find(params[:post_id])
    @micropost = post.microposts.find params[:id]
  end

  def edit; end

  def update; end

  def new
    post = Post.find(params[:post_id])
    @micropost = post.microposts.new
  end

  def create
    # post = current_user.posts.find(params[:post_id])
    post = Post.find(params[:post_id])

    params[:micropost][:user_id] = current_user.id
    micropost = post.microposts.create!(micropost_params)

    redirect_to post_micropost_path(post.id, micropost.id)
  end

  def destroy; end

  private

  def micropost_params
    params.require(:micropost).permit(:title, :content, :user_id)
  end
end

# def create
#   @post = Post.new(post_params)

#   respond_to do |format|
#     if @post.save
#       format.html { redirect_to @post, notice: 'Post was successfully created.' }
#       format.json { render :show, status: :created, location: @post }
#     else
#       format.html { render :new }
#       format.json { render json: @post.errors, status: :unprocessable_entity }
#     end
#   end
# end
