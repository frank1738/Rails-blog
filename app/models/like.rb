class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  belongs_to :author, class_name: 'User'
  def self.update_likes_counter
    Post.increment!(:likes_counter)
  end
end
