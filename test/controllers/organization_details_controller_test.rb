require 'test_helper'

class OrganizationDetailsControllerTest < ActionController::TestCase
  setup do
    @organization_detail = organization_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organization_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organization_detail" do
    assert_difference('OrganizationDetail.count') do
      post :create, organization_detail: { fair_end_date: @organization_detail.fair_end_date, fair_start_date: @organization_detail.fair_start_date, organization_id: @organization_detail.organization_id, total_attendance: @organization_detail.total_attendance }
    end

    assert_redirected_to organization_detail_path(assigns(:organization_detail))
  end

  test "should show organization_detail" do
    get :show, id: @organization_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organization_detail
    assert_response :success
  end

  test "should update organization_detail" do
    patch :update, id: @organization_detail, organization_detail: { fair_end_date: @organization_detail.fair_end_date, fair_start_date: @organization_detail.fair_start_date, organization_id: @organization_detail.organization_id, total_attendance: @organization_detail.total_attendance }
    assert_redirected_to organization_detail_path(assigns(:organization_detail))
  end

  test "should destroy organization_detail" do
    assert_difference('OrganizationDetail.count', -1) do
      delete :destroy, id: @organization_detail
    end

    assert_redirected_to organization_details_path
  end
end
