require 'test_helper'

class AdvertisementsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => Advertisement.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    Advertisement.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Advertisement.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to advertisement_url(assigns(:advertisement))
  end

  def test_edit
    get :edit, :id => Advertisement.first
    assert_template 'edit'
  end

  def test_update_invalid
    Advertisement.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Advertisement.first
    assert_template 'edit'
  end

  def test_update_valid
    Advertisement.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Advertisement.first
    assert_redirected_to advertisement_url(assigns(:advertisement))
  end

  def test_destroy
    advertisement = Advertisement.first
    delete :destroy, :id => advertisement
    assert_redirected_to advertisements_url
    assert !Advertisement.exists?(advertisement.id)
  end
end
