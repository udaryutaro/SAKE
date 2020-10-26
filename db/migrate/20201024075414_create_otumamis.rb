class CreateOtumamis < ActiveRecord::Migration[5.2]
  def change
    create_table :otumamis do |t|
      t.string :title, null: false
      t.string :image_id, null: false
      t.integer :user_id, null: false
      t.integer :otumami_genre_id, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
