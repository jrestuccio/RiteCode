require 'test_helper'

class Icd10sControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
