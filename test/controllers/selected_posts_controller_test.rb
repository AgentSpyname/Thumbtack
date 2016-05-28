require 'test_helper'

class SelectedPostsControllerTest < ActionController::TestCase
  setup do
    @selected_post = selected_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:selected_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create selected_post" do
    assert_difference('SelectedPost.count') do
      post :create, selected_post: { post_id: @selected_post.post_id }
    end

    assert_redirected_to selected_post_path(assigns(:selected_post))
  end

  test "should show selected_post" do
    get :show, id: @selected_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @selected_post
    assert_response :success
  end

  test "should update selected_post" do
    patch :update, id: @selected_post, selected_post: { post_id: @selected_post.post_id }
    assert_redirected_to selected_post_path(assigns(:selected_post))
  end

  test "should destroy selected_post" do
    assert_difference('SelectedPost.count', -1) do
      delete :destroy, id: @selected_post
    end

    assert_redirected_to selected_posts_path
  end
end
