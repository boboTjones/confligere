class CreateJournals < ActiveRecord::Migration
  def up
    create_table :journals do |t|
      t.string :title
      t.text  :entry
      t.timestamps
    end
  end
  
  def down
    drop_table :journals
  end
end
