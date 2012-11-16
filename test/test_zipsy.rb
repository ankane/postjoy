require "test/unit"
require "zipsy"

class ZipsyTest < Test::Unit::TestCase

  def test_find
    assert_equal Zipsy.find("94108"), {:city=>"San Francisco", :state=>"CA", :lat=>37.79, :lng=>-122.4, :time_zone=>"Pacific Time (US & Canada)", :decommissioned=>false}
  end

  def test_find_for_non_existant_zip_code
    assert_nil Zipsy.find(123456)
  end

  def test_active
    assert_true Zipsy.active?("94108")
  end

  def test_active_integer
    assert_true Zipsy.active?(94108)
  end

  def test_active_for_non_existant_zip_code
    assert_false Zipsy.active?(123456)
  end

end
