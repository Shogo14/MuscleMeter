class BodyPart < ApplicationRecord
    has_many :training_menu
    validates :name,presence: true, length: { maximum: 50 },uniqueness: true
end
