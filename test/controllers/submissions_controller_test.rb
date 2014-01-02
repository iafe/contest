require 'test_helper'

class SubmissionsControllerTest < ActionController::TestCase
  setup do
    @submission = submissions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:submissions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create submission" do
    assert_difference('Submission.count') do
      post :create, submission: { approved: @submission.approved, category_id: @submission.category_id, contest_year: @submission.contest_year, digital_version_received: @submission.digital_version_received, disqualify: @submission.disqualify, division_id: @submission.division_id, notes: @submission.notes, organization_id: @submission.organization_id, physical_version_received: @submission.physical_version_received, user_id: @submission.user_id }
    end

    assert_redirected_to submission_path(assigns(:submission))
  end

  test "should show submission" do
    get :show, id: @submission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @submission
    assert_response :success
  end

  test "should update submission" do
    patch :update, id: @submission, submission: { approved: @submission.approved, category_id: @submission.category_id, contest_year: @submission.contest_year, digital_version_received: @submission.digital_version_received, disqualify: @submission.disqualify, division_id: @submission.division_id, notes: @submission.notes, organization_id: @submission.organization_id, physical_version_received: @submission.physical_version_received, user_id: @submission.user_id }
    assert_redirected_to submission_path(assigns(:submission))
  end

  test "should destroy submission" do
    assert_difference('Submission.count', -1) do
      delete :destroy, id: @submission
    end

    assert_redirected_to submissions_path
  end
end
