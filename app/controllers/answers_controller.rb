class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answers = current_user.answers.all.order(created_at: :desc)
  end

  def new
    @answer = current_user.answers.new
    @question = Question.find_by_id(params[:question_id]) 
  end

  def create
    @answer = current_user.answers.new(answer_params)
    @question = Question.find_by_id(answer_params[:question_id])
    if @answer.save
      flash[:notice] = 'Answer added successfully'
      redirect_to answer_path(@answer)
    else
      flash[:notice] = @answer.errors.full_messages.to_sentence
      redirect_to new_answer_path(question_id: @question.id)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @answer.update(answer_params)
      flash[:notice] = "Answer edited successfully"
      redirect_to answer_path(@answer)
    else
      flash[:notice] = @answer.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @answer.destroy
    flash[:notice] = "Answer deleted succesfully"
    redirect_to answers_path
  end

  private

  def set_answer
    @answer = Answer.find_by_id(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:content, :user_id, :question_id)
  end
end
