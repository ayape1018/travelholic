class AddColumnToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :image_1, :string
    add_column :posts, :image_2, :string
    add_column :posts, :image_3, :string
  end
end
