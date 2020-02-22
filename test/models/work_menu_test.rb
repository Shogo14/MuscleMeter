
require 'test_helper'

class WorkMenuTest < ActiveSupport::TestCase
  def setup
    @work_menu_type = WorkMenuType.first
    @training_body_part = TrainingBodyPart.first
    @workmenu = WorkMenu.new(name: "スクワッド", 
                             work_menu_type_id: @work_menu_type.id,
                             training_body_part_id: @training_body_part.id)
  end

  test "ワークメニューが存在する場合" do
    @workmenu.valid?
    assert @workmenu.valid?
  end

  test "メニュー名が空白の場合エラーとなるか" do
    @workmenu.name = "     "
    assert_not @workmenu.valid?
  end

  # test "メニュー名が重複している場合、エラーとなるか" do
  #   duplicate_workmenu = @workmenu.dup
  #   duplicate_workmenu.name = @workmenu.name
  #   @workmenu.save
  #   assert_not duplicate_workmenu.valid?
  # end

  test "メニュー名が長すぎる場合" do
    @workmenu.name = "a" * 51
    assert_not @workmenu.valid?
  end
end
