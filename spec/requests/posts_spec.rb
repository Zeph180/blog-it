require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'assigns the user and posts' do
      user = User.create(name: 'John Doe')
      post1 = Post.create(title: 'First Post', text: 'Lorem ipsum', author_id: user.id)
      post2 = Post.create(title: 'Second Post', text: 'Dolor sit amet', author_id: user.id)

      expect(Post.count).to eq(2)

      get :index, params: { user_id: user.id }

      expect(assigns(:user)).to eq(user)
      expect(assigns(:posts)).to contain_exactly(post1, post2)
    end

    it 'renders the index template' do
      user = User.create(name: 'John Doe')

      get :index, params: { user_id: user.id }

      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the post' do
      author = User.create!(name: 'John Doe')
      post = Post.create!(title: 'First Post', text: 'Lorem ipsum', author: author)

      get :show, params: { id: post.id }

      expect(assigns(:post)).to eq(post)
    end

    it 'renders the show template' do
      author = User.create!(name: 'John Doe')
      post = Post.create!(title: 'First Post', text: 'Lorem ipsum', author: author)

      get :show, params: { id: post.id }

      expect(response).to render_template(:show)
    end
  end
end
