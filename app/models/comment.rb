class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def update_comments(post)
    post.comments_counter += 1
  end
end
