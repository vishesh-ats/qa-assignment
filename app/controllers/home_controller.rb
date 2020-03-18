class HomeController < ApplicationController
  
  def index
  end
  
  def questions
    @questions = Question.all.order(created_at: :desc)
  end

  def question
    @question = Question.find_by_id(params[:id])
  end
end
