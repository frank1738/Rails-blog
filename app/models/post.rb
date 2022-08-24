class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comment
  has_many :like

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: true

  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    Comment.order(created_at: :desc).limit(5)
  end
end
