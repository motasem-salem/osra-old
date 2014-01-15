require 'test_helper'

class SponsorsControllerTest < ActionController::TestCase
  setup do
    @sponsor = sponsors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sponsors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sponsor" do
    assert_difference('Sponsor.count') do
      post :create, sponsor: { additional_info: @sponsor.additional_info, address: @sponsor.address, contact_1: @sponsor.contact_1, contact_2: @sponsor.contact_2, country: @sponsor.country, email: @sponsor.email, gender: @sponsor.gender, name: @sponsor.name, orgnization_id: @sponsor.orgnization_id, osra_id: @sponsor.osra_id, partnership_start_date: @sponsor.partnership_start_date, status: @sponsor.status, type: @sponsor.type }
    end

    assert_redirected_to sponsor_path(assigns(:sponsor))
  end

  test "should show sponsor" do
    get :show, id: @sponsor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sponsor
    assert_response :success
  end

  test "should update sponsor" do
    patch :update, id: @sponsor, sponsor: { additional_info: @sponsor.additional_info, address: @sponsor.address, contact_1: @sponsor.contact_1, contact_2: @sponsor.contact_2, country: @sponsor.country, email: @sponsor.email, gender: @sponsor.gender, name: @sponsor.name, orgnization_id: @sponsor.orgnization_id, osra_id: @sponsor.osra_id, partnership_start_date: @sponsor.partnership_start_date, status: @sponsor.status, type: @sponsor.type }
    assert_redirected_to sponsor_path(assigns(:sponsor))
  end

  test "should destroy sponsor" do
    assert_difference('Sponsor.count', -1) do
      delete :destroy, id: @sponsor
    end

    assert_redirected_to sponsors_path
  end
end
