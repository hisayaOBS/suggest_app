require 'test_helper'

class PersonsControllerTest < ActionDispatch::IntegrationTest
  test "should get thema" do
    get persons_thema_url
    assert_response :success
  end

  test "should get question" do
    get persons_question_url
    assert_response :success
  end

end
