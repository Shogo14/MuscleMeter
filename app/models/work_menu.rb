class WorkMenu < ApplicationRecord
    belongs_to :work_menu_type
    belongs_to :training_body_part
    validates :name, presence: true, length: { maximum: 50 }
end
