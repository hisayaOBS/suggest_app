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
end
