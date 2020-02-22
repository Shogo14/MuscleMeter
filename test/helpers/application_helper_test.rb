require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Mix UP"
    assert_equal full_title("Help"), "Help | Mix UP"
  end
end