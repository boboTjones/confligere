class AddUserIdToRelationships < ActiveRecord::Migration[5.0]
  def change
    add_column :relationships, :user_id, :integer
  end
end
