require 'rails_helper'

RSpec.feature 'User Profile', type: :feature do
  scenario 'displays user profile details and posts' do
    # Create test data
    user = User.create(name: 'John Doe', photo: 'john.jpg', bio: 'Lorem ipsum')
    post1 = Post.create(title: 'Post 1', text: 'Lorem ipsum dolor sit amet', id: 2, author_id: user.id)
    post2 = Post.create(title: 'Post 2', text: 'Consectetur adipiscing elit', id: 3, author_id: user.id)

    # Visit the user profile page
    visit user_path(user)

    # Verify user profile details
    expect(page).to have_css('.user-card')
    expect(page).to have_selector('.usr-pic[src="john.jpg"]')
    expect(page).to have_content('John Doe')
    expect(page).to have_content('Number of posts: 2')

    expect(page).to have_css('.bio.boarder')
    expect(page).to have_content('Bio')
    expect(page).to have_content('Lorem ipsum')

    # Verify post details

    within('.post-card', match: :first) do
      expect(page).to have_content('Post 2')
      expect(page).to have_content('Consectetur adipiscing elit')
      expect(page).to have_content('Comments: 0')
      expect(page).to have_content('Likes: 0')
    end

    within(all('.post-card').last) do
      expect(page).to have_content('Post 1')
      expect(page).to have_content('Lorem ipsum dolor sit amet')
      expect(page).to have_content('Comments: 0')
      expect(page).to have_content('Likes: 0')
    end

    # Verify the "See all posts" button
    expect(page).to have_button('See all posts')
  end

  scenario 'create new post' do
    # Create a user for the logged in user
    user = User.create(name: 'John Doe', photo: 'john.jpg', bio: 'Lorem ipsum')

    # Visit the user profile page
    visit user_path(user)

    # Fill in the form and submit
    fill_in 'Title', with: 'New Post'
    fill_in 'Content', with: 'This is a new post'
  end
end
