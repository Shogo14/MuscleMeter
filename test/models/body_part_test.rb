require 'test_helper'

class BodyPartTest < ActiveSupport::TestCase
  def setup
    @body_part = body_parts(:Triceps)
  end

  test "値が有効かをチェック" do
    assert @body_part.valid?
  end

  test "名前が空白の場合をチェック" do
    @body_part.name = "     "
    assert_not @body_part.valid?
  end

  test "名前が長過ぎる時のチェック" do
    @body_part.name = "a" * 51
    assert_not @body_part.valid?
  end

  test "部位の重複チェック" do
    duplicate_body_part = @body_part.dup
    @body_part.save
    assert_not duplicate_body_part.valid?
  end
end
