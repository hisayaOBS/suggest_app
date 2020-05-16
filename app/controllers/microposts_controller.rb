# frozen_string_literal: true

class MicropostsController < ApplicationController
  def index
    @microposts = Micropost.where(post_id: params[:post_id])
    @like = Like.where(user_id: current_user.id, post_id: params[:post_id])
  end

  def show
    post = Post.find(params[:post_id])
    @micropost = post.microposts.find params[:id]
  end

  def edit
    @micropost = Micropost.find params[:id]
    unless current_user.id == @micropost.user_id
      flash[:danger] = 'あなたの投稿ではないので編集できません'
      redirect_to 'index'
    end
  end

  def update
    micropost = Micropost.find(params[:id])
    if micropost.update(micropost_params)
      flash[:success] = '編集しました'
      redirect_to post_microposts_path(params[:post_id])
    else
      flash.now[:danger] = '編集できません'
      render 'edit'
    end
  end

  def new
    post = Post.find(params[:post_id])
    @micropost = post.microposts.new
  end

  def create
    post = Post.find(params[:post_id])
    params[:micropost][:user_id] = current_user.id
    micropost = post.microposts.create!(micropost_params)
    flash[:success] = '投稿しました'
    redirect_to "/posts/#{post.id}/microposts"
  end

  def destroy
    @microposts = Micropost.where(post_id: params[:post_id])
    micropost = Micropost.find(params[:id])
    if current_user.id == micropost.user_id
      micropost.destroy
      flash[:success] = '削除しました'
      redirect_to post_microposts_path params[:post_id]
    else
      flash[:danger] = 'あなたの投稿ではないので削除できません'
      render 'index'
    end
  end

  def like
    @microposts = Micropost.where(post_id: params[:post_id])
    if Like.where(user_id: current_user.id, micropost_id: params[:id], post_id: params[:post_id]).any?
      like = Like.find_by(user_id: current_user.id, micropost_id: params[:id], post_id: params[:post_id])
      like.destroy
      redirect_to post_microposts_path params[:post_id]
    else
      Like.create(user_id: current_user.id, micropost_id: params[:id], post_id: params[:post_id])
      # @microposts = Micropost.where(post_id: params[:post_id])
      redirect_to post_microposts_path params[:post_id]
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:title, :content, :user_id)
  end
end
