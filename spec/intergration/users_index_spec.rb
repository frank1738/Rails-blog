require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
  describe 'Post' do
    before(:all) do
      @user = User.first!
      @post1 = Post.first!
    end

    it "shows user's profile picture" do
      visit(users_path)
      expect(page).to have_css('img[src*="https://dummyimage.com/600x400/000/fff"]')
    end

    it 'shows the users username' do
      visit(users_path)
      expect(page).to have_content('frank')
      expect(page).to have_content('tom')
    end

    it 'shows number of posts of user has written' do
      visit(users_path)
      expect(page).to have_content('Number of posts: 3')
      expect(page).to have_content('Number of posts: 2')
    end
    it 'When I click on a user, I am redirected to that users show page' do
      visit(user_posts_path(@user.id))
      click_link 'Ruby and Rails 1'
      expect(page).to have_current_path user_post_path(@post1.author_id, @post1)
    end
  end
end
