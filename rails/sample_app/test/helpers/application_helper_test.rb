require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "ROR Sample App"
    assert_equal full_title("Help"), "Help | ROR Sample App"
  end
end