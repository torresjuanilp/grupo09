require 'test_helper'

class QuestionControllerTest < ActionDispatch::IntegrationTest
  test "should get create_question" do
    get question_create_question_url
    assert_response :success
  end

end
