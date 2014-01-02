require 'test_helper'

class UserOrganizationsControllerTest < ActionController::TestCase
  setup do
    @user_organization = user_organizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_organizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_organization" do
    assert_difference('UserOrganization.count') do
      post :create, user_organization: { organization_id: @user_organization.organization_id, primary: @user_organization.primary, user_id: @user_organization.user_id }
    end

    assert_redirected_to user_organization_path(assigns(:user_organization))
  end

  test "should show user_organization" do
    get :show, id: @user_organization
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_organization
    assert_response :success
  end

  test "should update user_organization" do
    patch :update, id: @user_organization, user_organization: { organization_id: @user_organization.organization_id, primary: @user_organization.primary, user_id: @user_organization.user_id }
    assert_redirected_to user_organization_path(assigns(:user_organization))
  end

  test "should destroy user_organization" do
    assert_difference('UserOrganization.count', -1) do
      delete :destroy, id: @user_organization
    end

    assert_redirected_to user_organizations_path
  end
end
