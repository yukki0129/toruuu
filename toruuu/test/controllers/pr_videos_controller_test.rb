require 'test_helper'

class PrVideosControllerTest < ActionController::TestCase
  setup do
    @pr_video = pr_videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pr_videos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pr_video" do
    assert_difference('PrVideo.count') do
      post :create, pr_video: { description: @pr_video.description, title: @pr_video.title, video: @pr_video.video }
    end

    assert_redirected_to pr_video_path(assigns(:pr_video))
  end

  test "should show pr_video" do
    get :show, id: @pr_video
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pr_video
    assert_response :success
  end

  test "should update pr_video" do
    patch :update, id: @pr_video, pr_video: { description: @pr_video.description, title: @pr_video.title, video: @pr_video.video }
    assert_redirected_to pr_video_path(assigns(:pr_video))
  end

  test "should destroy pr_video" do
    assert_difference('PrVideo.count', -1) do
      delete :destroy, id: @pr_video
    end

    assert_redirected_to pr_videos_path
  end
end
