class CreateRelationships < ActiveRecord::Migration
  def up
    create_table :relationships do |t|
      t.string    :first_name
      t.string    :nickname
      t.integer   :duration
      t.integer   :age
      t.boolean   :primary
      t.string    :first_contact
      t.string    :occupation
      t.integer   :education
    end
  end
  
  def down
    drop_table :relationships
  end
end
