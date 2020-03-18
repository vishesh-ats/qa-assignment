class FollowingsController < ApplicationController
  before_action :authenticate_user!
  
  def follow_user
    user = User.find_by_id(params[:id])
    @followings = current_user.followeds.new(followable_type: 'User', followable_id: user.id, follower_id: user.id)
    if @followings.save
      flash[:notice] = "User followed Successfully"
      redirect_to home_questions_path
    else
      flash[:notice] = @followings.errors.full_messages.to_sentence
      redirect_to home_questions_path
    end
  end
  
  def follow_topic
    topic = Topic.find_by_id(params[:id])
    @followings = current_user.followeds.new(followable_type: 'Topic', followable_id: topic.id, follower_id: topic.user_id)
    if @followings.save
      flash[:notice] = "Topic followed Successfully"
      redirect_to home_questions_path
    else
      flash[:notice] = @followings.errors.full_messages.to_sentence
      redirect_to home_questions_path
    end
  end
end
