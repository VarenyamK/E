class RemoveDaysFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :days, :string
  end
end
