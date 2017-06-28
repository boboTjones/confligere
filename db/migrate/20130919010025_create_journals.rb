class CreateJournals < ActiveRecord::Migration[5.0]
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
