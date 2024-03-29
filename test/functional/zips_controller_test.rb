require 'test_helper'

class ZipsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:zips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create zip" do
    assert_difference('Zip.count') do
      post :create, :zip => { }
    end

    assert_redirected_to zip_path(assigns(:zip))
  end

  test "should show zip" do
    get :show, :id => zips(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => zips(:one).to_param
    assert_response :success
  end

  test "should update zip" do
    put :update, :id => zips(:one).to_param, :zip => { }
    assert_redirected_to zip_path(assigns(:zip))
  end

  test "should destroy zip" do
    assert_difference('Zip.count', -1) do
      delete :destroy, :id => zips(:one).to_param
    end

    assert_redirected_to zips_path
  end
end
