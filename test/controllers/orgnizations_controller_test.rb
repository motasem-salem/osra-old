require 'test_helper'

class OrgnizationsControllerTest < ActionController::TestCase
  setup do
    @orgnization = orgnizations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orgnizations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orgnization" do
    assert_difference('Orgnization.count') do
      post :create, orgnization: { country: @orgnization.country, name: @orgnization.name, osra_id: @orgnization.osra_id, partnership_start_date: @orgnization.partnership_start_date, region: @orgnization.region, status: @orgnization.status }
    end

    assert_redirected_to orgnization_path(assigns(:orgnization))
  end

  test "should show orgnization" do
    get :show, id: @orgnization
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orgnization
    assert_response :success
  end

  test "should update orgnization" do
    patch :update, id: @orgnization, orgnization: { country: @orgnization.country, name: @orgnization.name, osra_id: @orgnization.osra_id, partnership_start_date: @orgnization.partnership_start_date, region: @orgnization.region, status: @orgnization.status }
    assert_redirected_to orgnization_path(assigns(:orgnization))
  end

  test "should destroy orgnization" do
    assert_difference('Orgnization.count', -1) do
      delete :destroy, id: @orgnization
    end

    assert_redirected_to orgnizations_path
  end
end
