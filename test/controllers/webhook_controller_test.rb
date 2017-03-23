require 'test_helper'

class WebhookControllerTest < ActionDispatch::IntegrationTest
  test "should get submit" do
    get webhook_submit_url
    assert_response :success
  end

end
