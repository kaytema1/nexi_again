require 'test_helper'

class ArticleStatusTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ArticleStatus.new.valid?
  end
end
