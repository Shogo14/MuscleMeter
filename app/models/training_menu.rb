class TrainingMenu < ApplicationRecord
    has_many :work_outs
    validates :name, presence: true, length: { maximum: 50 },uniqueness: true
end
