class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :title
      t.text   :notes
      t.integer :severity
      t.string :type
      t.datetime :occurred_at
      t.timestamps
    end
  end
  
  def down
    drop_table :events
  end
end
