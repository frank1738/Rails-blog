class Like < ApplicationRecord
  def self.update_likes_counter
    Post.increment!(:likes_counter)
  end
end
