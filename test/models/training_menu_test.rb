require 'test_helper'

class TrainingMenuTest < ActiveSupport::TestCase
  def setup
    @training_type = training_types(:Barbell)
    @body_part = body_parts(:Pectoralis)
    @training_menu = @training_type.training_menu.create
    @training_menu.body_part_id = @body_part.id
  end

  test "値が正常化をチェック" do
    @training_menu.name = "ベンチプレス"
    assert @training_menu.valid?
  end
end
