class Topic < ApplicationRecord
  belongs_to :user
  
  def self.set_topic(question, topics, current_user)
    all_topics = topics.split(',')
    all_topics.each do |topic|
      new_topic = current_user.topics.find_or_create_by(content: topic)
      question_topic = QuestionTopic.create(question_id: question.id, topic_id: new_topic.id)
    end
  end  
end
