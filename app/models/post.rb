class Post < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'
  def self.update_posts_counter
    author.increment!(:posts_counter)
  end

  def self.recent_comments
    Comment.order(created_at: :desc).limit(5)
  end
end
