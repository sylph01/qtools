require 'test_helper'

class MatchImagesControllerTest < ActionController::TestCase
  setup do
    @match_image = match_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:match_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create match_image" do
    assert_difference('MatchImage.count') do
      post :create, match_image: { image: @match_image.image, match_id: @match_image.match_id }
    end

    assert_redirected_to match_image_path(assigns(:match_image))
  end

  test "should show match_image" do
    get :show, id: @match_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @match_image
    assert_response :success
  end

  test "should update match_image" do
    put :update, id: @match_image, match_image: { image: @match_image.image, match_id: @match_image.match_id }
    assert_redirected_to match_image_path(assigns(:match_image))
  end

  test "should destroy match_image" do
    assert_difference('MatchImage.count', -1) do
      delete :destroy, id: @match_image
    end

    assert_redirected_to match_images_path
  end
end
