class WorkMenuType < ApplicationRecord
    validates :work_type, presence: true, length: { maximum: 50 },
                     uniqueness: { case_sensitive: false }
end
