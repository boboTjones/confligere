class CreateGoals < ActiveRecord::Migration
  def up
    create_table :goals do |t|
      t.string :summary
      t.integer :scale
      t.integer :user_id
      t.timestamps
    end
  end
  
  def down
    drop_table :goals
  end
end
