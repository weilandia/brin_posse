require 'test_helper'

class PairingSessionsControllerTest < ActionController::TestCase
  setup do
    @pairing_session = pairing_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pairing_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pairing_session" do
    assert_difference('PairingSession.count') do
      post :create, pairing_session: { complete: @pairing_session.complete }
    end

    assert_redirected_to pairing_session_path(assigns(:pairing_session))
  end

  test "should show pairing_session" do
    get :show, id: @pairing_session
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pairing_session
    assert_response :success
  end

  test "should update pairing_session" do
    patch :update, id: @pairing_session, pairing_session: { complete: @pairing_session.complete }
    assert_redirected_to pairing_session_path(assigns(:pairing_session))
  end

  test "should destroy pairing_session" do
    assert_difference('PairingSession.count', -1) do
      delete :destroy, id: @pairing_session
    end

    assert_redirected_to pairing_sessions_path
  end
end
