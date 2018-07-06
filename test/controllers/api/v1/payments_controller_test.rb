require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create_rent" do
    get payments_create_rent_url
    assert_response :success
  end

end
