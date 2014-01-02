require 'test_helper'

class ScoreDetailsControllerTest < ActionController::TestCase
  setup do
    @score_detail = score_details(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:score_details)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create score_detail" do
    assert_difference('ScoreDetail.count') do
      post :create, score_detail: { points: @score_detail.points, score_id: @score_detail.score_id, score_item_id: @score_detail.score_item_id }
    end

    assert_redirected_to score_detail_path(assigns(:score_detail))
  end

  test "should show score_detail" do
    get :show, id: @score_detail
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @score_detail
    assert_response :success
  end

  test "should update score_detail" do
    patch :update, id: @score_detail, score_detail: { points: @score_detail.points, score_id: @score_detail.score_id, score_item_id: @score_detail.score_item_id }
    assert_redirected_to score_detail_path(assigns(:score_detail))
  end

  test "should destroy score_detail" do
    assert_difference('ScoreDetail.count', -1) do
      delete :destroy, id: @score_detail
    end

    assert_redirected_to score_details_path
  end
end
