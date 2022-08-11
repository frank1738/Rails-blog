class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  def self.recent_comments
    Comment.order(created_at: :desc).limit(5)
  end
end
