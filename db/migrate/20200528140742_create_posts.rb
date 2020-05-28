class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :image1
      t.string :image2
      t.string :image3
      t.integer :place_id
      t.integer :user_id
      t.string :status
      t.timestamps
    end

    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :telephone
      t.string :url
      t.string :image
      t.string :status
      t.integer :country_id
      t.integer :user_id
      t.timestamps
    end

    create_table :countries do |t|
      t.string :name
      t.string :area_id
      t.timestamps
    end

    create_table :areas do |t|
      t.string :name
      t.timestamps
    end

  end
end
