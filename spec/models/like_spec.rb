require 'rails_helper'

RSpec.describe Like, type: :model do
  first_user = User.create(name: 'frank', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           bio: 'Engineer', posts_counter: 0)

  first_post = Post.create(author_id: first_user.id, title: 'Hello', text: 'This is my first post', comments_counter: 2,
                           likes_counter: 3)

  first_like = Like.create(post_id: first_post.id, author_id: first_user.id)

  context 'Write unit tests for Like Model Methods' do
    it 'updates like counter from 3 t0 4' do
      number = first_like.update_likes_counter(first_post)
      expect(number).to be 4
    end
    it 'updates like counter from 4 to 5' do
      number = first_like.update_likes_counter(first_post)
      expect(number).to be 5
    end
  end
end
