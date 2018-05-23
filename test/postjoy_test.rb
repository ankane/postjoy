require_relative "test_helper"

class TestPostjoy < Minitest::Test
  def test_find
    expected = {
      city: "San Francisco",
      state: "California",
      state_code: "CA",
      latitude: 37.7917,
      longitude: -122.4186
    }
    assert_equal expected, Postjoy.find(94109)
  end

  def test_find_for_non_existent_postal_code
    assert_nil Postjoy.find(123456)
  end

  def test_validation
    assert User.new(postal_code: "12345").valid?
    assert !User.new(postal_code: "123456").valid?
  end
end
