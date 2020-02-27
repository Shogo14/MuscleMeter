class TrainingMenu < ApplicationRecord
    belongs_to :training_type
    belongs_to :body_part
    validates :name, presence: true, length: { maximum: 50 },uniqueness: true
end
