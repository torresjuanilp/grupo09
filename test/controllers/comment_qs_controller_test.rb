require 'test_helper'

class CommentQsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment_q = comment_qs(:one)
  end

  test "should get index" do
    get comment_qs_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_q_url
    assert_response :success
  end

  test "should create comment_q" do
    assert_difference('CommentQ.count') do
      post comment_qs_url, params: { comment_q: {  } }
    end

    assert_redirected_to comment_q_url(CommentQ.last)
  end

  test "should show comment_q" do
    get comment_q_url(@comment_q)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_q_url(@comment_q)
    assert_response :success
  end

  test "should update comment_q" do
    patch comment_q_url(@comment_q), params: { comment_q: {  } }
    assert_redirected_to comment_q_url(@comment_q)
  end

  test "should destroy comment_q" do
    assert_difference('CommentQ.count', -1) do
      delete comment_q_url(@comment_q)
    end

    assert_redirected_to comment_qs_url
  end
end
