require 'test_helper'

class NavbarItemsControllerTest < ActionController::TestCase
  setup do
    @navbar_item = navbar_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:navbar_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create navbar_item" do
    assert_difference('NavbarItem.count') do
      post :create, navbar_item: { name: @navbar_item.name }
    end

    assert_redirected_to navbar_item_path(assigns(:navbar_item))
  end

  test "should show navbar_item" do
    get :show, id: @navbar_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @navbar_item
    assert_response :success
  end

  test "should update navbar_item" do
    patch :update, id: @navbar_item, navbar_item: { name: @navbar_item.name }
    assert_redirected_to navbar_item_path(assigns(:navbar_item))
  end

  test "should destroy navbar_item" do
    assert_difference('NavbarItem.count', -1) do
      delete :destroy, id: @navbar_item
    end

    assert_redirected_to navbar_items_path
  end
end
