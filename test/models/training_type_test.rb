require 'test_helper'

class TrainingTypeTest < ActiveSupport::TestCase
  def setup
    @training_type = training_types(:Barbell)
  end

  test "値が有効かをチェック" do
    assert @training_type.valid?
  end

  test "名前が空白の場合をチェック" do
    @training_type.name = "     "
    assert_not @training_type.valid?
  end

  test "名前が長過ぎる時のチェック" do
    @training_type.name = "a" * 51
    assert_not @training_type.valid?
  end

  test "トレーニングタイプの重複チェック" do
    duplicate_training_type = @training_type.dup
    @training_type.save
    assert_not duplicate_training_type.valid?
  end
end
