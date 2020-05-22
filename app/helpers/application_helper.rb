# frozen_string_literal: true

module ApplicationHelper
  require 'date'
  def full_title(title = '')
    base_title = 'SUGGEST!!'
    if title.empty?
      base_title
    else
      title + ' | ' + base_title
    end
  end

  def active?(action_name)
    return 'active' if action_name == params[:action]
  end

  def active_controller?(controller_name)
    return 'active' if controller_name == params[:controller]
  end

  def success_msg
    if flash[:success] || flash[:notice]
      content_tag(:div, class: 'alert alert-success') do
        if !flash[:success].nil?
          flash[:success]
        else
          flash[:notice]
        end
      end
    end
  end

  def danger_msg
    if flash[:danger] || flash[:alert]
      content_tag(:div, class: 'alert alert-danger') do
        if !flash[:danger].nil?
          flash[:danger]
        else
          flash[:notice]
        end
      end
    end
  end
end
