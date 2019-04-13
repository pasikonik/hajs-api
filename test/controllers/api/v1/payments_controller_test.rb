# frozen_string_literal: true

require 'test_helper'

class Api::V1::PaymentsControllerTest < ActionDispatch::IntegrationTest
  test 'should get create_rent' do
    get payments_create_rent_url
    assert_response :success
  end
end
