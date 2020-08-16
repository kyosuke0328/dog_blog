class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|

      t.timestamps
      t.integer :member_id
      t.integer :blog_id
      t.integer :photo_id
      t.text :comment
    end
  end
end
