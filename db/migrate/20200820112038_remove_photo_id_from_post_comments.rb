class RemovePhotoIdFromPostComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :post_comments, :photo_id, :integer
  end
end
