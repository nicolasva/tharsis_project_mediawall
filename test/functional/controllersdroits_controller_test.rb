require 'test_helper'

class ControllersdroitsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:controllersdroits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create controllersdroit" do
    assert_difference('Controllersdroit.count') do
      post :create, :controllersdroit => { }
    end

    assert_redirected_to controllersdroit_path(assigns(:controllersdroit))
  end

  test "should show controllersdroit" do
    get :show, :id => controllersdroits(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => controllersdroits(:one).to_param
    assert_response :success
  end

  test "should update controllersdroit" do
    put :update, :id => controllersdroits(:one).to_param, :controllersdroit => { }
    assert_redirected_to controllersdroit_path(assigns(:controllersdroit))
  end

  test "should destroy controllersdroit" do
    assert_difference('Controllersdroit.count', -1) do
      delete :destroy, :id => controllersdroits(:one).to_param
    end

    assert_redirected_to controllersdroits_path
  end
end
