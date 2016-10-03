require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  test "requires a name" do
    assert !Customer.new.valid?
    assert Customer.new(:name => "Sam Jones").valid?
  end
end
