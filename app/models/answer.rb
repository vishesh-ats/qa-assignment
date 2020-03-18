class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  
  validate :can_not_answer_own_question
  validate :already_answered
  
  private
  def can_not_answer_own_question
    own_question = self.question.user_id == self.user_id
    self.errors[:base] << 'You can not Answer of your own Question' if own_question 
  end
  
  def already_answered
    answered = Answer.where(user_id: user_id, question_id: question_id).first
    self.errors[:base] << 'You already answered this Question' if answered.present?
  end
end
