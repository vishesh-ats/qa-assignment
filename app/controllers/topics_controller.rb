class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = current_user.topics.all.order(created_at: :desc)
  end

  def new
    @topic = current_user.topics.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      flash[:notice] = 'Answer added successfully'
      redirect_to topic_path(@topic)
    else
      flash[:notice] = @topic.errors.full_messages.to_sentence
      redirect_to new_topic_path(question_id: @question.id)
    end
  end

  def show
  end

  def edit

  end

  def update
    if @topic.update(topic_params)
      flash[:notice] = "Answer edited successfully"
      redirect_to topic_path(@topic)
    else
      flash[:notice] = @topic.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @topic.destroy
    flash[:notice] = "Answer deleted succesfully"
    redirect_to topics_path
  end

  private

  def set_topic
    @topic = Topic.find_by_id(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:content, :user_id)
  end
end
