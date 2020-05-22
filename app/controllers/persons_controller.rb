# frozen_string_literal: true

class PersonsController < ApplicationController
  def thema
    @persons = Micropost.where(user_id: current_user.id)
    @post = @persons.first
  end

  def question
    @persons = Question.where(user_id: current_user.id)
  end
end
