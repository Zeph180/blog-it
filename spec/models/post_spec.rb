require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:author) { User.create(name: 'John Doe', photo: 'pic', bio: 'qwerrtyhu') }
  let(:post) { Post.new(title: 'Test Post', text: 'Lorem ipsum', author_id: author.id) }

  describe '#last_five_comments' do
    it 'returns the last five comments' do
      post.save!
      post.comments.create([{ text: 'Comment 1' }, { text: 'Comment 2' }, { text: 'Comment 3' }, { text: 'Comment 4' },
                            { text: 'Comment 5' }, { text: 'Comment 6' }, { text: 'Comment 7' }, { text: 'Comment 8' }, { text: 'Comment 9' }])
      expect(post.last_five_comments).to eq(post.comments.last(5))
    end
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(post).to be_valid
    end

    it 'is invalid without a title' do
      post.title = nil
      expect(post).not_to be_valid
    end

    it 'is invalid if title length exceeds 250 characters' do
      post.title = 'a' * 251
      expect(post).not_to be_valid
    end

    it 'is invalid without an author' do
      post.author_id = nil
      expect(post).not_to be_valid
    end

    it 'is valid with a comments count of 0' do
      post.comments_count = 0
      expect(post).to be_valid
    end

    it 'is valid with a likes count of 0' do
      post.likes_count = 0
      expect(post).to be_valid
    end

    it 'is invalid if comments count is not an integer' do
      post.comments_count = 1.5
      expect(post).not_to be_valid
    end

    it 'is invalid if likes count is not an integer' do
      post.likes_count = 1.5
      expect(post).not_to be_valid
    end

    it 'is invalid if comments count is less than 0' do
      post.comments_count = -1
      expect(post).not_to be_valid
    end

    it 'is invalid if likes count is less than 0' do
      post.likes_count = -1
      expect(post).not_to be_valid
    end
  end
end
