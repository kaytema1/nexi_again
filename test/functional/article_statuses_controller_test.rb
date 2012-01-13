require 'test_helper'

class ArticleStatusesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end

  def test_show
    get :show, :id => ArticleStatus.first
    assert_template 'show'
  end

  def test_new
    get :new
    assert_template 'new'
  end

  def test_create_invalid
    ArticleStatus.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    ArticleStatus.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to article_status_url(assigns(:article_status))
  end

  def test_edit
    get :edit, :id => ArticleStatus.first
    assert_template 'edit'
  end

  def test_update_invalid
    ArticleStatus.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ArticleStatus.first
    assert_template 'edit'
  end

  def test_update_valid
    ArticleStatus.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ArticleStatus.first
    assert_redirected_to article_status_url(assigns(:article_status))
  end

  def test_destroy
    article_status = ArticleStatus.first
    delete :destroy, :id => article_status
    assert_redirected_to article_statuses_url
    assert !ArticleStatus.exists?(article_status.id)
  end
end
