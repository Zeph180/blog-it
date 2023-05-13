require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: "John") }

  describe "associations" do
    it { should have_many(:posts).with_foreign_key(:author_id).dependent(:destroy) }
    it { should have_many(:comments).with_foreign_key(:author_id) }
    it { should have_many(:likes).with_foreign_key(:author_id).class_name('Like').dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:posts_count).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe "#last_three_posts" do
    let!(:user) { create(:user) }
    let!(:post1) { create(:post, author: user) }
    let!(:post2) { create(:post, author: user) }
    let!(:post3) { create(:post, author: user) }
    let!(:post4) { create(:post, author: user) }

    it "returns the last three posts" do
      expect(user.last_three_posts).to eq([post2, post3, post4])
    end
  end
end
