require File.join(File.dirname(__FILE__), "..", "test_helper")

class DistilleriesControllerTest < ActionController::TestCase
  context "A distillery" do
    setup do
      @distillery = Factory(:distillery)
    end

    should "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:distilleries)
    end

    should "should get new" do
      get :new
      assert_response :success
    end

    should "should create distillery" do
      assert_difference('Distillery.count') do
        post :create, :distillery => @distillery.attributes
      end

      assert_redirected_to distillery_path(assigns(:distillery))
    end

    should "should show distillery" do
      get :show, :id => @distillery.to_param
      assert_response :success
    end

    should "should get edit" do
      get :edit, :id => @distillery.to_param
      assert_response :success
    end

    should "should update distillery" do
      put :update, :id => @distillery.to_param, :distillery => @distillery.attributes
      assert_redirected_to distillery_path(assigns(:distillery))
    end

    should "should destroy distillery" do
      assert_difference('Distillery.count', -1) do
        delete :destroy, :id => @distillery.to_param
      end

      assert_redirected_to distilleries_path
    end
  end
end
