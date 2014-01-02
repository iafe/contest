require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  setup do
    @category = categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post :create, category: { award_id: @category.award_id, code: @category.code, description: @category.description, document_max_number: @category.document_max_number, enabled: @category.enabled, max_total_file_size: @category.max_total_file_size, name: @category.name, photo_max_number: @category.photo_max_number, rules: @category.rules, video_max_number: @category.video_max_number }
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
    get :show, id: @category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @category
    assert_response :success
  end

  test "should update category" do
    patch :update, id: @category, category: { award_id: @category.award_id, code: @category.code, description: @category.description, document_max_number: @category.document_max_number, enabled: @category.enabled, max_total_file_size: @category.max_total_file_size, name: @category.name, photo_max_number: @category.photo_max_number, rules: @category.rules, video_max_number: @category.video_max_number }
    assert_redirected_to category_path(assigns(:category))
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete :destroy, id: @category
    end

    assert_redirected_to categories_path
  end
end
