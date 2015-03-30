require 'test_helper'

class PowersControllerTest < ActionController::TestCase
  setup do
    @power = powers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:powers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create power" do
    assert_difference('Power.count') do
      post :create, power: { powernum: @power.powernum }
    end

    assert_redirected_to power_path(assigns(:power))
  end

  test "should show power" do
    get :show, id: @power
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @power
    assert_response :success
  end

  test "should update power" do
    patch :update, id: @power, power: { powernum: @power.powernum }
    assert_redirected_to power_path(assigns(:power))
  end

  test "should destroy power" do
    assert_difference('Power.count', -1) do
      delete :destroy, id: @power
    end

    assert_redirected_to powers_path
  end
end
