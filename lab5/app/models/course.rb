class Course < ApplicationRecord
  validates :class_id, format: { with: /\A[A-Z]{3} \d{4}\z/,
                                message: " format must be 3 Capital letters a space and 4 digits"}
  validates :component, inclusion: { in: %w(LEC LAB IND), message: ' must be LEC, LAB or IND.' }
  validates :section, numericality: { only_integer: true, message: ' must be a number.' }, allow_nil: true
  validates :gradersneeded, numericality: { only_integer: true, message: ' must be a number.' }, allow_nil: true
  validates :gradersfilled, numericality: { only_integer: true, message: ' must be a number.' }, allow_nil: true
end
