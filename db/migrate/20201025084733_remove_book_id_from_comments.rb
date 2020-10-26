class RemoveBookIdFromComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :book_id, :integer
  end
end
