class AddMessage2toUser < ActiveRecord::Migration
  def self.up
    add_column :users, :seen_message_2, :string
    rename_column :users , :seen_message, :seen_message_1
  end

  def self.down
  end
  
end
