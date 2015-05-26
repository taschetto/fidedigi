require 'test_helper'

class CouponsControllerTest < ActionController::TestCase
  test "should get redeem" do
    get :redeem
    assert_response :success
  end

end
