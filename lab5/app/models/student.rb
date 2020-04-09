class Student < ApplicationRecord
  has_many :grades, dependent: :destroy
  accepts_nested_attributes_for :grades, allow_destroy: true, reject_if: :all_blank
end
