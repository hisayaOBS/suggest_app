# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    # @posts = Post.all.order(end_date: 'ASC')
    @posts = Post.where('end_date >= ?', Date.today).order(end_date: 'ASC')
    @posts_result = Post.where('end_date < ?', Date.today).order(end_date: 'DESC')
  end

  def help; end

  def about; end

  def contact; end
end
