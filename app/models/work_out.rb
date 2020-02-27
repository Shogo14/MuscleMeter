class WorkOut < ApplicationRecord
  belongs_to :user
  belongs_to :training_menu
  default_scope -> { order(training_date: :desc) }
  validates :training_date, uniqueness: {scope: [:user_id, :training_menu_id, :weight]}
 
end
