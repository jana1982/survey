class AddSeenMessageToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :seen_message, :string
  end

  def self.down
  end
end
