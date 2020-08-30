class RemovePhotoIdFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :photo_id, :integer
  end
end
