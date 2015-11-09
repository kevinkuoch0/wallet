require 'test_helper'

class UsersCardsControllerTest < ActionController::TestCase
  setup do
    @users_card = users_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create users_card" do
    assert_difference('UsersCard.count') do
      post :create, users_card: { card_id: @users_card.card_id, user_id: @users_card.user_id }
    end

    assert_redirected_to users_card_path(assigns(:users_card))
  end

  test "should show users_card" do
    get :show, id: @users_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @users_card
    assert_response :success
  end

  test "should update users_card" do
    patch :update, id: @users_card, users_card: { card_id: @users_card.card_id, user_id: @users_card.user_id }
    assert_redirected_to users_card_path(assigns(:users_card))
  end

  test "should destroy users_card" do
    assert_difference('UsersCard.count', -1) do
      delete :destroy, id: @users_card
    end

    assert_redirected_to users_cards_path
  end
end
