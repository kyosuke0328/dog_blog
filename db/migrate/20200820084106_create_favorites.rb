class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|

      t.timestamps
	  t.integer :member_id
	  t.integer :blog_id
	  t.integer :photo_id
    end
  end
end
