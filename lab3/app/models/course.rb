class Course < ApplicationRecord
  def self.create_from_collection(courses)
    courses.each do |course_hash|
      Course.create(course_hash)
    end

  end
end
