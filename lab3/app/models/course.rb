class Course < ApplicationRecord
  # validates that the section is a number
  validates :section, numericality: { only_integer: true, message: ' must be a number.' }
  # validates that the component is either lec, lab, or ind
  validates :component, inclusion: { in: %w(LEC LAB IND), message: ' must be LEC, LAB or IND.' }
end
