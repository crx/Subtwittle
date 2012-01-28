require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "it loads" do
    get :index
    assert_response :success
  end
end
