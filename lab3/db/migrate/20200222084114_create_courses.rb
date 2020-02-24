class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :class
      t.integer :section
      t.string :component
      t.string :time
      t.string :location
      t.string :professor

      t.timestamps
    end
  end
end
