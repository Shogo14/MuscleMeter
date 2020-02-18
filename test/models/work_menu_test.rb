
require 'test_helper'

class WorkMenuTest < ActiveSupport::TestCase
  def setup
    @workmenu = WorkMenu.new(name: "スクワッド", work_menu_type_id: 1)
  end

  test "ワークメニューが存在する場合" do
    assert @workmenu.valid?
  end

  test "メニュー名が空白の場合エラーとなるか" do
    @workmenu.name = "     "
    assert_not @workmenu.valid?
  end

  test "メニュー名が重複している場合、エラーとなるか" do
    duplicate_workmenu = @workmenu.dup
    duplicate_workmenu.name = @workmenu.name
    @workmenu.save
    assert_not duplicate_workmenu.valid?
  end

  test "メニュー名が長すぎる場合" do
    @workmenu.name = "a" * 51
    assert_not @workmenu.valid?
  end
end
