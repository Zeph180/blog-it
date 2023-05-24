require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  before do
    @user = User.create(name: 'John Doe', id: 1)
    @post = Post.create(id: 1, title: 'Test Post', text: 'This is a test post', author_id: @user.id, likes_count: 0, comments_count: 0)
  end

  describe 'Post show page' do
    it 'displays the post details' do
      visit user_post_path(@post)

      expect(page).to have_content(@post.title)
      expect(page).to have_content(@user.name)
      expect(page).to have_content('Comments: 0')
      expect(page).to have_content('Likes: 0')
      expect(page).to have_selector('.text', text: @post.text)
    end

    it 'displays comments' do
      comment1 = Comment.create(user_id: @user.id, post_id: @post.id, text: 'First comment')
      comment2 = Comment.create(user_id: @user.id, post_id: @post.id, text: 'Second comment')

      visit user_post_path(@post)
      puts page.body

      expect(page).to have_selector('.comment-sec')
      expect(page).to have_content('Comments')
      expect(page).to have_content("#{comment1.text}")
      expect(page).to have_selector('p', text: "#{comment2.user_id} : #{comment2.text}")
    end

    it 'allows liking and unliking the post' do
      visit user_post_path(@post)

      expect(page).to have_link('Like')
      expect(page).not_to have_link('Unlike')

      click_link 'Like'
      expect(page).not_to have_link('Like')
      expect(page).to have_link('Unlike')

      click_link 'Unlike'
      expect(page).to have_link('Like')
      expect(page).not_to have_link('Unlike')
    end

    it 'allows creating a comment' do
      visit user_post_path(@post)

      fill_in 'Content', with: 'This is a new comment'
      click_button 'Create Comment'

      expect(page).to have_content('This is a new comment')
    end
  end
end
