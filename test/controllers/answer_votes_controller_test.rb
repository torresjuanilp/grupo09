require 'test_helper'

class AnswerVotesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get answer_votes_create_url
    assert_response :success
  end

end
