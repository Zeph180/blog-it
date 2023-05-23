require 'rails_helper'

RSpec.feature 'Users', type: :feature do
  scenario 'displays user details with post count' do
    # Create test data
    user1 = User.create(name: 'John Doe', photo: 'john.jpg')
    user2 = User.create(name: 'Jane Smith', photo: 'jane.jpg')
    post1 = user1.posts.create(title: 'Post 1', text: 'Lorem ipsum')
    post2 = user1.posts.create(title: 'Post 2', text: 'Dolor sit amet')

    # Visit the users page
    visit users_path

    # Verify user details and post count
    expect(page).to have_link(href: user_path(user1))
    expect(page).to have_css('.user-card', count: 2)
    expect(page).to have_selector('.usr-pic[src="john.jpg"]')
    expect(page).to have_content('John Doe')
    expect(page).to have_content('Number of Posts: 2')

    expect(page).to have_link(href: user_path(user2))
    expect(page).to have_selector('.usr-pic[src="jane.jpg"]')
    expect(page).to have_content('Jane Smith')
    expect(page).to have_content('Number of Posts: 0')
  end
end
