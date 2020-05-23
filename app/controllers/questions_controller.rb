# frozen_string_literal: true

class QuestionsController < ApplicationController
  def index
    @questions = Question.where('end_date >= ?', Date.today).order(end_date: 'ASC')

    @answer = Answer.where(user_id: current_user.id)
    # @answer_counts = Answer.wher).count
  end

  def result_index
    @questions_result = Question.where('end_date < ?', Date.today).order(end_date: 'DESC')
  end

  def new
    @question = Question.new
  end

  def create
    # question = Question.find(params[:post_id])
    section = [params[:business], params[:it], params[:medical], params[:government], params[:event]].join
    params[:question][:section] = section
    params[:question][:user_id] = current_user.id
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = 'アンケートを投稿しました'
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    section = [params[:business], params[:it], params[:medical], params[:government], params[:event]].join
    params[:question][:section] = section
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:success] = 'アンケートを編集しました'
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def destroy
    question = Question.find_by(id: params[:id])
    if question && question.user_id == current_user.id
      question.destroy
      flash[:success] = 'アンケートを削除しました'
      redirect_to questions_path
    else
      flash.now[:alert] = 'アンケートを削除できませんでした'
      render 'index'
    end
  end

  def answer
    # debugger
    if Answer.where(user_id: current_user.id, question_id: params[:id]).any?
      # 既にレコード有り(update)
      answer = Answer.find_by(user_id: current_user.id, question_id: params[:id])
      if params[:answer_id] == '0' # 反対
        answer.update_attributes(answer: false)
        flash[:danger] = '反対しました'
        redirect_to questions_path
      else
        answer.update_attributes(answer: true)
        flash[:success] = '賛成しました'
        redirect_to questions_path
      end

    else
      # レコードなし(create)
      if params[:answer_id] == '0' # 反対
        Answer.create(user_id: current_user.id, question_id: params[:id], answer: false)
        flash[:danger] = '反対しました'
        redirect_to questions_path
      else
        Answer.create(user_id: current_user.id, question_id: params[:id], answer: true)
        flash[:success] = '賛成しました'
        redirect_to questions_path
      end
    end
  end

  private

  def question_params
    params.require(:question).permit(:user_id, :title, :content, :start_date, :end_date, :section)
  end
end
