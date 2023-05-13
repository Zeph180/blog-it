require 'rails_helper'

RSpec.describe Like, type: :model do
  describe '#update_likes_count' do
    let(:author) { User.create(name: 'Alice') }
    let(:post) { Post.create(title: 'Test Post', text: 'well come', author:) }
    let(:like) { Like.create(author:, post:) }

    it 'updates the like count for the post' do
      expect do
        like.update_like_count
      end.to change { post.reload.likes_count }.from(0).to(1)
    end
  end
end
