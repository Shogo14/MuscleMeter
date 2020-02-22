class TrainingBodyPart < ApplicationRecord
    has_many :work_menu
    validates :work_type, presence: true, length: { maximum: 50 },
                     uniqueness: { case_sensitive: false }
end
