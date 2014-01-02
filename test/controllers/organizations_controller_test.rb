require 'test_helper'

class OrganizationsControllerTest < ActionController::TestCase
  setup do
    @organization = organizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:organizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create organization" do
    assert_difference('Organization.count') do
      post :create, organization: { address_line_1: @organization.address_line_1, address_line_2: @organization.address_line_2, city: @organization.city, country: @organization.country, enabled: @organization.enabled, fair: @organization.fair, name: @organization.name, phone: @organization.phone, primary_contact: @organization.primary_contact, state_province: @organization.state_province, zip_code: @organization.zip_code }
    end

    assert_redirected_to organization_path(assigns(:organization))
  end

  test "should show organization" do
    get :show, id: @organization
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @organization
    assert_response :success
  end

  test "should update organization" do
    patch :update, id: @organization, organization: { address_line_1: @organization.address_line_1, address_line_2: @organization.address_line_2, city: @organization.city, country: @organization.country, enabled: @organization.enabled, fair: @organization.fair, name: @organization.name, phone: @organization.phone, primary_contact: @organization.primary_contact, state_province: @organization.state_province, zip_code: @organization.zip_code }
    assert_redirected_to organization_path(assigns(:organization))
  end

  test "should destroy organization" do
    assert_difference('Organization.count', -1) do
      delete :destroy, id: @organization
    end

    assert_redirected_to organizations_path
  end
end
