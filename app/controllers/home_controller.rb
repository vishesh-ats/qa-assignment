class HomeController < ApplicationController
  
  def index
  end
  
  def questions
    @questions = Question.all.order(created_at: :desc)
  end
end
