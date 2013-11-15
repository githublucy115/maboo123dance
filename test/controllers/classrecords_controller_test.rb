require 'test_helper'

class ClassrecordsControllerTest < ActionController::TestCase
  setup do
    @classrecord = classrecords(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:classrecords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create classrecord" do
    assert_difference('Classrecord.count') do
      post :create, classrecord: { cost: @classrecord.cost, date: @classrecord.date }
    end

    assert_redirected_to classrecord_path(assigns(:classrecord))
  end

  test "should show classrecord" do
    get :show, id: @classrecord
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @classrecord
    assert_response :success
  end

  test "should update classrecord" do
    patch :update, id: @classrecord, classrecord: { cost: @classrecord.cost, date: @classrecord.date }
    assert_redirected_to classrecord_path(assigns(:classrecord))
  end

  test "should destroy classrecord" do
    assert_difference('Classrecord.count', -1) do
      delete :destroy, id: @classrecord
    end

    assert_redirected_to classrecords_path
  end
end
