# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    redirect_to root_path
  end

  def new
    @start_date = Time.now.strftime('%Y-%m-%d')
    @post = Post.new
  end

  def create
    section = [params[:business], params[:it], params[:medical], params[:government], params[:event]].join
    params[:post][:section] = section
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = '募集テーマを投稿しました'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show; end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    section = [params[:business], params[:it], params[:medical], params[:government], params[:event]].join
    params[:post][:section] = section
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      flash[:success] = '募集テーマを編集しました'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    if post && post.user_id == current_user.id
      post.destroy
      flash[:success] = '募集テーマを削除しました'
      redirect_to root_path
    else
      flash.now[:alert] = '募集テーマを削除できませんでした'
      render 'index'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :section, :start_date, :end_date, :count_limit)
  end

  # def section_check
  #   if @post.section.include?("")
  #     @post.section.

  #   end
  # end
end
