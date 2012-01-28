require 'test_helper'

class TweetimageControllerTest < ActionController::TestCase
  test "submitting form will redirect to proper destination URL" do
    get :index, :twitter_handle => 'BarackObama'
    assert_redirected_to "/tweetimage/BarackObama"
  end
end
