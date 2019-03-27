require 'test_helper'

class FormulariesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get formularies_create_url
    assert_response :success
  end

  test "should get show" do
    get formularies_show_url
    assert_response :success
  end

end
