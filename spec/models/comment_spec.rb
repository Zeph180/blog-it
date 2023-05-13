require 'rails_helper'

describe Comment, type: :model do
  let(:user) { User.create(id: 1, name: 'John Doe') }
  let(:post) { Post.create(title: 'Hello World', text: 'Lorem ipsum dolor sit amet', author_id: user.id) }

  describe '#update_comment_count' do
    it 'updates the comments count of the associated post' do
      comment = post.comments.create(text: 'Great post!', author_id: user.id, user_id: user.id)
      expect do
        comment.update_comment_count
        post.reload
      end.to change { post.comments_count }.by(1)
    end
  end

  describe 'associations' do
    it { should belong_to(:post) }
    it { should belong_to(:author).class_name('User') }
  end

  describe 'validations' do
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_most(1000) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:post_id) }
    it { should validate_presence_of(:author_id) }
  end
end
