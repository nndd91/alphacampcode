class AddIndexToStudents < ActiveRecord::Migration[5.1]
  def change
    add_index :students, :id, unique: true
  end
end
