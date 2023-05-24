require 'rails_helper'

RSpec.describe 'posts/show', type: :feature do
  let(:user) { User.create(id: 1, name: 'John Doe') }
  let(:post) { Post.create(id: 1, title: 'Test Post', text: 'This is a test post', author_id: user.id) }

  before do
    visit user_post_path(post)
  end

  it 'displays the post details' do
    expect(page).to have_content(post.title)
    expect(page).to have_content(user.name)
    expect(page).to have_content('Comments: 0')
    expect(page).to have_content('Likes: 0')
    expect(page).to have_content(post.text)
  end

  it 'displays the username and comment text for each comment' do
    # Assuming you have comment records associated with the post
    comment1 = Comment.create(user_id: user.id, post_id: post.id, text: 'First comment', author_id: user.id)
    comment2 = Comment.create(user_id: user.id, post_id: post.id, text: 'Second comment', author_id: user.id)

    visit user_post_path(post)

    expect(page).to have_content(user.name)
    expect(page).to have_content(comment1.text)
    expect(page).to have_content(comment2.text)
  end

  # it 'allows liking and unliking the post' do
  #   click_link 'Like'
  #   expect(page).to have_link('Unlike')

  #   click_link 'Unlike'
  #   expect(page).to have_link('Like')
  # end

  # it 'allows creating a comment' do
  #   fill_in 'comment_content', with: 'This is a new comment'
  #   click_button 'Create Comment'

  #   expect(page).to have_content('This is a new comment')
  # end
end
