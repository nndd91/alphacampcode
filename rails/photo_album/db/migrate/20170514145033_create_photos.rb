class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.date :date
      t.text :description
      t.string :file_location
      t.string :is_public
      t.string :boolean
      t.integer :capacity

      t.timestamps
    end
  end
end
