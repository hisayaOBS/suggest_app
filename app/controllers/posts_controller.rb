# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    section = [params[:business], params[:it], params[:medical], params[:government], params[:event]].join
    params[:post][:section] = section
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
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
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    if post
      post.destroy
      flash[:success] = '削除しました'
      redirect_to posts_url
    else
      flash[:danger] = 'この投稿は削除できません'
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
