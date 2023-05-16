require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #index' do
    it 'assigns all users to @users' do
      user1 = User.create(name: 'John')
      user2 = User.create(name: 'Jane')

      get :index

      expect(assigns(:users)).to eq([user1, user2])
    end

    it 'renders the index template' do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(name: 'John') }

    before do
      allow(User).to receive(:find_by).and_return(user)
      allow(Post).to receive_message_chain(:where, :order, :limit).and_return([])
    end

    it 'assigns the requested user to @user' do
      get :show, params: { id: user.id }

      expect(assigns(:user)).to eq(user)
    end

    it 'assigns posts belonging to the user to @posts' do
      posts = [Post.new(title: 'Post 1'), Post.new(title: 'Post 2')]
      allow(Post).to receive_message_chain(:where, :order, :limit).and_return(posts)

      get :show, params: { id: user.id }

      expect(assigns(:posts)).to eq(posts)
    end

    it 'renders the show template' do
      get :show, params: { id: user.id }

      expect(response).to render_template(:show)
    end
  end
end
