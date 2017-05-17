class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.integer :age
      t.integer :grade
      t.integer :gender
      t.boolean :playing_sport

      t.timestamps
    end
  end
end
