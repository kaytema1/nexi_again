require 'test_helper'

class JobsTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Jobs.new.valid?
  end
end
