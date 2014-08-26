require 'test_helper'

class TiebreakersControllerTest < ActionController::TestCase
  setup do
    @tiebreaker = tiebreakers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tiebreakers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tiebreaker" do
    assert_difference('Tiebreaker.count') do
      post :create, tiebreaker: { away_score: @tiebreaker.away_score, game_id: @tiebreaker.game_id, home_score: @tiebreaker.home_score, user_id: @tiebreaker.user_id }
    end

    assert_redirected_to tiebreaker_path(assigns(:tiebreaker))
  end

  test "should show tiebreaker" do
    get :show, id: @tiebreaker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tiebreaker
    assert_response :success
  end

  test "should update tiebreaker" do
    patch :update, id: @tiebreaker, tiebreaker: { away_score: @tiebreaker.away_score, game_id: @tiebreaker.game_id, home_score: @tiebreaker.home_score, user_id: @tiebreaker.user_id }
    assert_redirected_to tiebreaker_path(assigns(:tiebreaker))
  end

  test "should destroy tiebreaker" do
    assert_difference('Tiebreaker.count', -1) do
      delete :destroy, id: @tiebreaker
    end

    assert_redirected_to tiebreakers_path
  end
end
