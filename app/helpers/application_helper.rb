# frozen_string_literal: true

module ApplicationHelper
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

  def success_msg
    if flash[:success]
      content_tag(:div, class: 'alert alert-success') do
        flash[:success]
      end
    end
end

  def danger_msg
    if flash[:danger]
      content_tag(:div, class: 'alert alert-danger') do
        flash[:danger]
      end
    end
  end
end
