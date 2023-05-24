require 'rails_helper'
RSpec.feature 'User Profile' do
  before do
    # Optionally, set up any necessary data or perform actions before each test case
    @user = User.create(name: 'John Doe', photo: 'john.jpg', id: 2)
    @post1 = Post.create(id: 1, title: 'Post 1', text: 'Lorem ipsum dolor sit amet', author_id: @user.id)
    @post2 = Post.create(id: 2, title: 'Post 2', text: 'Consectetur adipiscing elit', author_id: @user.id)
    @like1 = Like.create(post: @post1)
    @like2 = Like.create(post: @post2)
  end
  scenario 'displays user profile details and posts' do
    visit user_path(@user)
    puts page.body
    expect(page).to have_content(@user.name)
    expect(page).to have_content('Number of posts: 2')
    within(all('.post-card').last) do
      expect(page).to have_content(@post1.title)
      expect(page).to have_content(@post1.text)
      expect(page).to have_content('Comments: 0')
      expect(page).to have_content('Likes: 0')
    end
    within('.post-card', match: :first) do
      expect(page).to have_content(@post2.title)
      expect(page).to have_content(@post2.text)
      expect(page).to have_content('Comments: 0')
      expect(page).to have_content('Likes: 0')
    end
  end
end
