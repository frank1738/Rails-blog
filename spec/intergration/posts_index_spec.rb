require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
  describe 'Post' do
    before(:all) do
      @user = User.first!
      @post1 = Post.first!
      @post2 = Post.second!
      @post3 = Post.third!
    end

    it "shows user's profile picture" do
      visit(user_posts_path(@user.id))
      expect(page).to have_css('img[src*="https://dummyimage.com/600x400/000/fff"]')
    end

    it 'shows the users username' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content('frank')
    end

    it 'shows number of posts of user has written' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content('Number of posts: 3')
    end

    it 'shows posts title' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content('Ruby and Rails 1')
    end

    it 'can see some of the post body' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content 'this is first post about Ruby and Rails! 1'
    end

    it 'can see the first comment on a post' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content 'Absolutely amazing'
    end

    it "redirects the user to the post's show page after clickin on it" do
      visit(user_posts_path(@user.id))
      click_link 'Ruby and Rails 1'
      expect(page).to have_current_path user_post_path(@post1.author_id, @post1)
    end
    it 'I can see how many comments a post has' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content 'comments: 0'
    end
    it 'I can see how many likes a post has' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content 'likes: 0'
    end
    it 'I can see a section of pagination if there are more posts than fit the view' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content 'pagination'
    end
  end
end
