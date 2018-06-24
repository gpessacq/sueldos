require 'test_helper'

class SueldosControllerTest < ActionController::TestCase
  test "should get index" do
    get sueldos
    assert_response :success
  end

end
