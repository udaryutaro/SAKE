class AddOtumamiIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :otumami_id, :integer
  end
end
