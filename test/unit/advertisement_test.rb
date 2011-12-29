require 'test_helper'

class AdvertisementTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Advertisement.new.valid?
  end
end
