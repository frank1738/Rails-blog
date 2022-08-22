require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
  describe 'Post' do
    before(:all) do
      @user = User.first!
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
      visit(users_path(@user.id))
      expect(page).to have_content('Number of posts: 3')
    end
  end
end
