class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string   :username
      t.string   :email
      t.string   :password_hash
      t.string   :password_salt
      t.string   :first_name
      t.string   :last_name
      t.string   :marital_status
      t.string   :orientation
      t.string   :gender
      t.boolean  :so_is_user, default: false
      t.integer  :age
      t.string   :occupation
      t.integer  :education
      t.integer  :children
      t.timestamps
    end
  end
  
  def down
    drop_table :users
  end
end
