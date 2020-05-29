class RenameColumnForPosts < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :image, :images
  end
end
