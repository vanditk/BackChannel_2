require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "should be able to login and browse" do

    https!
    get "users/index"
    assert_response :success

    post_via_redirect "posts/index", :username => "a", :password => "12345"
    assert_response :success

    get "/posts/comment"
    assert_response :success


  end


end
