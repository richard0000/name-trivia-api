require "test_helper"

class NameGenderControllerTest < ActionDispatch::IntegrationTest
  test "should get gender" do
    get name_gender_gender_url
    assert_response :success
  end

  test "should get famous_people" do
    get name_gender_famous_people_url
    assert_response :success
  end

  test "should get send_info" do
    get name_gender_send_info_url
    assert_response :success
  end
end
