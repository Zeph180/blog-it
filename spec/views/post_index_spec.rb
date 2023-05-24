require 'rails_helper'

RSpec.describe "User Profile", type: :feature do
  before do
    # Create a user and their associated posts and comments for testing
    @user = User.create(id: 1, name: "John Doe", photo: "user_photo.jpg")
    @post1 = Post.create(id: 1, title: "Post 1", text: "Lorem ipsum dolor sit amet.", author_id: @user.id)
    @post2 = Post.create(id: 2, title: "Post 2", text: "Consectetur adipiscing elit.", author_id: @user.id)
    @comment1 = Comment.create(text: "Comment 1", post: @post1, user_id: @user.id)
    @comment2 = Comment.create(text: "Comment 2", post: @post1, user_id: @user.id)
    @like = Like.create(post_id: @post1.id, user_id: @user.id)

    visit user_path(@user)

    puts page.body
  end

  it "displays the user's profile picture" do
    expect(page).to have_css(".usr-pic[src='user_photo.jpg']")
  end

  it "displays the user's username" do
    expect(page).to have_content("John Doe")
  end

  it "displays the number of posts the user has written" do
    expect(page).to have_content("Number of posts: 2")
  end

  it "displays a post's title and body" do
    # expect(page).to have_link("Post 1", href: user_post_path(@user, @post1))
    expect(page).to have_content("Lorem ipsum dolor sit amet.")
    expect(page).to have_content("Post 2")
    expect(page).to have_content("Consectetur adipiscing elit.")
  end
end
