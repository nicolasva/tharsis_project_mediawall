require 'test_helper'

class ControllersDroitsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:controllers_droits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create controllers_droit" do
    assert_difference('ControllersDroit.count') do
      post :create, :controllers_droit => { }
    end

    assert_redirected_to controllers_droit_path(assigns(:controllers_droit))
  end

  test "should show controllers_droit" do
    get :show, :id => controllers_droits(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => controllers_droits(:one).to_param
    assert_response :success
  end

  test "should update controllers_droit" do
    put :update, :id => controllers_droits(:one).to_param, :controllers_droit => { }
    assert_redirected_to controllers_droit_path(assigns(:controllers_droit))
  end

  test "should destroy controllers_droit" do
    assert_difference('ControllersDroit.count', -1) do
      delete :destroy, :id => controllers_droits(:one).to_param
    end

    assert_redirected_to controllers_droits_path
  end
end
