require 'test_helper'

class GroupappsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:groupapps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create groupapp" do
    assert_difference('Groupapp.count') do
      post :create, :groupapp => { }
    end

    assert_redirected_to groupapp_path(assigns(:groupapp))
  end

  test "should show groupapp" do
    get :show, :id => groupapps(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => groupapps(:one).to_param
    assert_response :success
  end

  test "should update groupapp" do
    put :update, :id => groupapps(:one).to_param, :groupapp => { }
    assert_redirected_to groupapp_path(assigns(:groupapp))
  end

  test "should destroy groupapp" do
    assert_difference('Groupapp.count', -1) do
      delete :destroy, :id => groupapps(:one).to_param
    end

    assert_redirected_to groupapps_path
  end
end
