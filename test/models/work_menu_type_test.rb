require 'test_helper'

class WorkMenuTypeTest < ActiveSupport::TestCase

  def setup
    @workmenutype = WorkMenuType.new(work_type: "バーベル")
  end

  test "ワークメニュータイプが存在する場合" do
    assert @workmenutype.valid?
  end

  test "ワークメニュータイプが空白の場合エラーとなるか" do
    @workmenutype.work_type = "     "
    assert_not @workmenutype.valid?
  end

  # test "ワークメニュータイプが重複している場合、エラーとなるか" do
  #   duplicate_workmenutype = @workmenutype.dup
  #   duplicate_workmenutype.work_type = @workmenutype.work_type
  #   @workmenutype.save
  #   assert_not duplicate_workmenutype.valid?
  # end

  test "ワークメニュータイプが長すぎる場合" do
    @workmenutype.work_type = "a" * 51
    assert_not @workmenutype.valid?
  end
end
