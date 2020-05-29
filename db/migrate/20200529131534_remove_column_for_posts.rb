class RemoveColumnForPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :image2, :string
    remove_column :posts, :image3, :string
    rename_column :posts, :image1, :image
  end
end
