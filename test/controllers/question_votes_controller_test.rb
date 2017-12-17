require 'test_helper'

class QuestionVotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get question_votes_index_url
    assert_response :success
  end

  test "should get show" do
    get question_votes_show_url
    assert_response :success
  end

end
