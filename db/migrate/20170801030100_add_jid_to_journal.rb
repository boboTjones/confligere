class AddJidToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :jid, :string
  end
end
