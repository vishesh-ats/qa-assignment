class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :questions
  has_many :answers
  has_many :topics
  
  has_many :followers, foreign_key: :follower_id, class_name: 'Following'
  has_many :followeds, foreign_key: :followed_id, class_name: 'Following'
  has_many :following, foreign_key: :followed_id, class_name: 'Following'
end
