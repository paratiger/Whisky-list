require File.join(File.dirname(__FILE__), "..", "test_helper")

class WhiskiesControllerTest < ActionController::TestCase
  
  context "A whisky" do
    setup do
      @whisky = Factory(:whisky)
    end

    should "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:whiskies)
    end

    should "should show whisky" do
      get :show, :id => @whisky.to_param
      assert_response :success
    end

    should "should get edit" do
      get :edit, :id => @whisky.to_param
      assert_response :success
    end

    should "should update whisky" do
      put :update, :id => @whisky.to_param, :whisky => @whisky.attributes
      assert_redirected_to whisky_path(assigns(:whisky))
    end

    should "should destroy whisky" do
      assert_difference('Whisky.count', -1) do
        delete :destroy, :id => @whisky.to_param
      end

      assert_redirected_to whiskies_path
    end
  end
end
