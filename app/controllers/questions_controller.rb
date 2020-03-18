class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  
  def index
    @questions = current_user.questions.all.order(created_at: :desc)
  end
  
  def new
    @question = current_user.questions.new
  end
  
  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = 'Question added successfully'
      Topic.set_topic(@question, params[:topic], current_user)
      redirect_to question_path(@question)
    else
      flash[:notice] = @question.errors.full_messages.to_sentence
      render :new
    end
  end
  
  def show
  end

  def edit
  end
  
  def update
    if @question.update(question_params)
      flash[:notice] = "Question edited successfully"
      redirect_to question_path(@question)
    else
      flash[:notice] = @question.errors.full_messages.to_sentence
      render :edit
    end
  end
  
  def destroy
    @question.destroy
    flash[:notice] = "Question deleted succesfully"
    redirect_to questions_path
  end
  
  private
  
  def set_question
    @question = Question.find_by_id(params[:id])
  end
  
  def question_params
    params.require(:question).permit(:content, :user_id)
  end
end
