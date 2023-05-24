require 'rails_helper'

RSpec.describe 'User Show', type: :feature do
  before do
    # You can set up any necessary data here for testing
    @user = User.create(id: 1, name: 'John Doe', photo: 'user_photo.jpg', bio: 'Sample bio')
    @posts = @user.posts.create([
      { title: 'Post 1', text: 'Content 1' },
      { title: 'Post 2', text: 'Content 2' },
      { title: 'Post 3', text: 'Content 3' }
    ])
    @comments = @posts.map { |post| post.comments.create(text: 'Comment') }
  end

  it 'displays the user profile picture' do
    visit user_path(@user)
    puts page.body
    expect(page).to have_css("img[src='user_photo.jpg'][alt='User Photo']")
  end

  it 'displays the user username' do
    visit user_path(@user)
    expect(page).to have_content('John Doe')
  end

  it 'displays the number of posts the user has written' do
    visit user_path(@user)
    expect(page).to have_content('Number of posts: 3')
  end

  it 'displays the user bio' do
    visit user_path(@user)
    expect(page).to have_content('Bio')
    expect(page).to have_content('Sample bio')
  end

  it 'displays the user\'s first 3 posts' do
    visit user_path(@user)
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')
  end

  it 'displays a button to view all of a user\'s posts' do
    visit user_path(@user)
    expect(page).to have_button('See all posts')
  end

  # it 'redirects to the post show page when clicking a user\'s post' do
  #   visit user_path(@user)
  #   click_link 'Post 1'
  #   expect(current_path).to eq(post_path(@posts.first))
  # end

  # it 'redirects to the user\'s post index page when clicking to see all posts' do
  #   visit user_path(@user)
  #   click_button 'See all posts'
  #   expect(current_path).to eq(user_posts_path(@user))
  # end
end
