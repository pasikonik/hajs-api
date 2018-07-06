require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  test "should get create_rent" do
    get tasks_create_rent_url
    assert_response :success
  end

end
