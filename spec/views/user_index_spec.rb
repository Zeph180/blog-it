require 'rails_helper'

RSpec.describe 'User Index', type: :feature do
  before do
    @users = User.all
    @posts = Post.all
  end

  it 'displays the username of all other users' do
    visit users_path
    @users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'displays the profile picture for each user' do
    visit users_path
    @users.each do |user|
      expect(page).to have_css("img[src='#{user.photo}'][alt='User Photo']")
    end
  end

  it 'displays the number of posts each user has written' do
    visit users_path
    @users.each do |user|
      post_count = @posts.where(author_id: user.id).count
      expected_count = post_count.zero? ? '0' : post_count.to_s
      expect(page).to have_content("Number of Posts: #{expected_count}")
    end
  end

  it 'redirects to the user show page when clicking on a user' do
    visit users_path
    @users.each do |user|
      find("a[href='#{user_path(user)}']").click
      expect(current_path).to eq(user_path(user))
      visit users_path
    end
  end
end
