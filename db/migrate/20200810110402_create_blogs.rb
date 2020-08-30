class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|

      t.timestamps
      t.integer :member_id
      t.string :image_id
      t.string :title
      t.text :body
    end
  end
end
