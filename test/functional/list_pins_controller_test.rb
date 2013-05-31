require 'test_helper'

class ListPinsControllerTest < ActionController::TestCase
  setup do
    @list_pin = list_pins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:list_pins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list_pin" do
    assert_difference('ListPin.count') do
      post :create, list_pin: { description: @list_pin.description }
    end

    assert_redirected_to list_pin_path(assigns(:list_pin))
  end

  test "should show list_pin" do
    get :show, id: @list_pin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @list_pin
    assert_response :success
  end

  test "should update list_pin" do
    put :update, id: @list_pin, list_pin: { description: @list_pin.description }
    assert_redirected_to list_pin_path(assigns(:list_pin))
  end

  test "should destroy list_pin" do
    assert_difference('ListPin.count', -1) do
      delete :destroy, id: @list_pin
    end

    assert_redirected_to list_pins_path
  end
end
