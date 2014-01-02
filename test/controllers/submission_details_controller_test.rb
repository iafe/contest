require 'test_helper'

class SubmissionDetailsControllerTest < ActionController::TestCase
  setup do
    @submission_detail = submission_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submission_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submission_detail" do
    assert_difference('SubmissionDetail.count') do
      post :create, submission_detail: { file_url: @submission_detail.file_url, submission_id: @submission_detail.submission_id }
    end

    assert_redirected_to submission_detail_path(assigns(:submission_detail))
  end

  test "should show submission_detail" do
    get :show, id: @submission_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @submission_detail
    assert_response :success
  end

  test "should update submission_detail" do
    patch :update, id: @submission_detail, submission_detail: { file_url: @submission_detail.file_url, submission_id: @submission_detail.submission_id }
    assert_redirected_to submission_detail_path(assigns(:submission_detail))
  end

  test "should destroy submission_detail" do
    assert_difference('SubmissionDetail.count', -1) do
      delete :destroy, id: @submission_detail
    end

    assert_redirected_to submission_details_path
  end
end
