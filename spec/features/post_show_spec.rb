require 'rails_helper'

RSpec.describe 'PostShow', type: :feature do
  before do
    @user = User.create(name: 'John Doe', id: 1)
    @post = Post.create(title: 'Test Post', text: 'This is a test post', author_id: @user.id, id: 1)
  end

  it 'displays the post details' do
    visit user_post_path(@user, @post)

    puts page.body

    expect(page).to have_content(@post.title)
    expect(page).to have_content(@user.name)
    expect(page).to have_content('Comments: 0')
    expect(page).to have_content('Likes: 0')
    expect(page).to have_content(@post.text)
  end
end
