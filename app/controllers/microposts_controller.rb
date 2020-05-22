# frozen_string_literal: true

class MicropostsController < ApplicationController
  def index
    @post = Post.select('title', 'section', 'end_date').find(params[:post_id])
    @microposts = Micropost.where(post_id: params[:post_id])
    @like = Like.where(user_id: current_user.id, post_id: params[:post_id])
    @like_counts = Like.where(post_id: params[:post_id]).count
  end

  def show
    post = Post.find(params[:post_id])
    @micropost = post.microposts.find params[:id]
  end

  def edit
    @micropost = Micropost.find params[:id]
    unless current_user.id == @micropost.user_id
      flash[:danger] = 'あなたの提案投稿ではないので編集できません'
      redirect_to 'index'
    end
  end

  def update
    micropost = Micropost.find(params[:id])
    if micropost.update(micropost_params)
      flash[:success] = '提案投稿を編集しました'
      redirect_to post_microposts_path(params[:post_id])
    else

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
    if (micropost = post.microposts.create!(micropost_params))
      flash[:success] = 'あなたの提案を投稿しました'
      redirect_to "/posts/#{post.id}/microposts"
    else
      @micropost = post.microposts.new
      render 'new'
    end
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
      flash[:danger] = '提案の支持を解除しました'
      redirect_to post_microposts_path params[:post_id]
    else
      Like.create(user_id: current_user.id, micropost_id: params[:id], post_id: params[:post_id])
      # @microposts = Micropost.where(post_id: params[:post_id])
      flash[:success] = '提案を支持しました'
      redirect_to post_microposts_path params[:post_id]
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:title, :content, :user_id)
  end
end
