class Following < ApplicationRecord
  belongs_to :followable, polymorphic: true
  
  validate :can_not_follow_own
  validate :already_following
  
  private
  def can_not_follow_own
   case followable_type
     when 'User'
       self.errors[:base] << 'Could Not follow Own' if followed_id.eql?(followed_id)
     when 'Topic'
       self.errors[:base] << 'Could Not follow Own Topic' if followed_id.eql?(followed_id)
   end
  end
  
  def already_following
    following = Following.exists?(followable_id: followable_id, followed_id: followed_id, followable_type: followable_type)
    self.errors[:base] << 'Already following.' if following
  end
end
