require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_likes_count' do
    let(:author) { User.create(name: 'Alice') }
    let(:post) { Post.create(title: 'Test Post', text: "well come", author: author) }
    let(:like) { Like.create(author: author, post: post) }

    it 'updates the like count for the post' do
      expect {
        like.update_like_count
      }.to change { post.reload.likes_count }.from(0).to(1)
    end
  end
end
