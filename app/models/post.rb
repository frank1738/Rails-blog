class Post < ApplicationRecord
    def self.update_posts_counter
      author.increment!(:posts_counter)
    end

    def self.recent_comments
      Comment.order(created_at: :desc).limit(5)
    end
end
