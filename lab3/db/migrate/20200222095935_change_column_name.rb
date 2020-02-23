class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :courses, :class, :class_id
  end
end
