class AddCategoryToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :category, :integer null: false
  end
end
