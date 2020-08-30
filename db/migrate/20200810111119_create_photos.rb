class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|

      t.timestamps
      t.integer :member_id
      t.string :image_id
      t.string :title null: false
    end
  end
end
