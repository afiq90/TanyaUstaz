require 'test_helper'

class SoalansControllerTest < ActionController::TestCase
  setup do
    @soalan = soalans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soalans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soalan" do
    assert_difference('Soalan.count') do
      post :create, soalan: { description: @soalan.description, name: @soalan.name, title: @soalan.title }
    end

    assert_redirected_to soalan_path(assigns(:soalan))
  end

  test "should show soalan" do
    get :show, id: @soalan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soalan
    assert_response :success
  end

  test "should update soalan" do
    patch :update, id: @soalan, soalan: { description: @soalan.description, name: @soalan.name, title: @soalan.title }
    assert_redirected_to soalan_path(assigns(:soalan))
  end

  test "should destroy soalan" do
    assert_difference('Soalan.count', -1) do
      delete :destroy, id: @soalan
    end

    assert_redirected_to soalans_path
  end
end
