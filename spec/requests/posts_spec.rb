require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe "GET index" do
    let!(:user) { User.create(name: "John", photo: "john@example.com", bio: "Il love forever") }
    let!(:posts) do
      [
        Post.create(title: "First Post", author_id: user),
        Post.create(title: "Second Post", author_id: user),
        Post.create(title: "Third Post", author_id: user)
      ]
    end

    it "assigns the user and posts" do
      get user_posts_path(user_id: user.id)

      expect(assigns(:user)).to eq(user)
      expect(assigns(:posts)).to match_array(posts)
    end

    it "renders the index template" do
      get user_posts_path(user_id: user.id)

      expect(response).to render_template(:index)
    end
  end

  describe "GET show" do
    let!(:post) { Post.create(title: "Test Post") }

    it "assigns the post" do
      get user_post_path(user_id: post.author_id, id: post.id)

      expect(assigns(:post)).to eq(post)
    end

    it "renders the show template" do
      get user_post_path(user_id: post.author_id, id: post.id)

      expect(response).to render_template(:show)
    end
  end
end
