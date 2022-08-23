require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  describe 'Post' do
    before(:each) do
      @first_user = User.first!
      @second_user = User.second!

      @first_post = Post.first!
      @second_post = Post.second!
      @third_post = Post.third!
      @fourth_post = Post.fourth!
      @comment1 = Comment.first!
      @comment2 = Comment.second!

      visit user_post_path(@first_user, @first_post)
    end

    it 'shows the post title' do
      expect(page).to have_content('Ruby and Rails 1')
    end

    it 'shows the person who wrote the post' do
      expect(page).to have_content('frank')
    end

    it 'shows number of comments' do
      post = Post.first
      expect(page).to have_content(post.comments_counter)
    end

    it 'shows number of likes' do
      post = Post.first
      expect(page).to have_content(post.likes_counter)
    end

    it 'can see the post\'s body.' do
      expect(page).to have_content('this is first post about Ruby and Rails! 1')
    end

    it 'can see the username of each commentor.' do
      post = Post.first
      comment = post.comment.first
      expect(page).to have_content(comment.author.name)
    end

    it 'can see the comments of each commentor.' do
      expect(page).to have_content 'Absolutely amazing 1'
    end
  end
end
