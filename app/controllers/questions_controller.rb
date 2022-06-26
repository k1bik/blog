# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :set_question, only: %i[edit update show destroy]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new question_params

    if @question.save
      redirect_to questions_path
      flash[:success] = "Question created!"
    else
      render :new
    end
  end

  def update
    if @question.update question_params
      redirect_to questions_path
      flash[:success] = "Question updated!"
    else
      render :new
    end
  end

  def show; end

  def edit;	end

  def destroy
    @question.destroy
    redirect_to questions_path
    flash[:success] = "Question deleted!"
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end
