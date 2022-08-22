require 'rails_helper'

RSpec.describe 'users#show', type: :feature do
  describe 'Post' do
    before(:all) do
      @user = User.first!
      @post1 = Post.first!
    end

    it "shows user's profile picture" do
      visit(user_path(@user.id))
      expect(page).to have_css('img[src*="https://dummyimage.com/600x400/000/fff"]')
    end

    it 'shows the users username' do
      visit(user_path(@user.id))
      expect(page).to have_content('frank')
    end

    it 'shows users bio' do
      visit(user_path(@user.id))
      expect(page).to have_content('Bio')
    end
    it 'I can see the users first 3 posts.' do
      visit(user_path(@user.id))
      expect(page).to have_content('Ruby and Rails 5')
    end
    it 'I can see a button that lets me view all of a users posts.' do
      visit(user_path(@user.id))
      expect(page).to have_content('See all posts')
    end
    it 'When I click a users post, it redirects me to that posts show page.' do
      visit(user_posts_path(@user.id))
      click_link 'Ruby and Rails 1'
      expect(page).to have_current_path user_post_path(@post1.author_id, @post1)
    end
    it 'When I click to see all posts, it redirects me to the users posts index page.
    ' do
      visit(user_posts_path(@user))
      expect(page).to have_content('Ruby and Rails 1')
    end
  end
end
