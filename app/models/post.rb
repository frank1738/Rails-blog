class Post < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: true

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    Comment.order(created_at: :desc).limit(5)
  end
end
