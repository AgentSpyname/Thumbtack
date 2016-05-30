require 'test_helper'

class SettingsControllerTest < ActionController::TestCase
  test "should get edit_all" do
    get :edit_all
    assert_response :success
  end

  test "should get update_all" do
    get :update_all
    assert_response :success
  end

end
