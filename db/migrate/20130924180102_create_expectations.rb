class CreateExpectations < ActiveRecord::Migration[5.0]
  def up
    create_table :expectations do |t|
      t.integer :user_id
      t.string :summary
      t.integer :scale
      t.timestamps
    end
  end
  
  def down
    drop_table :expectations
  end
end
