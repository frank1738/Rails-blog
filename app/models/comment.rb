class Comment < ApplicationRecord
  def self.recent_comments
    Comment.order(created_at: :desc).limit(5)
  end
end
