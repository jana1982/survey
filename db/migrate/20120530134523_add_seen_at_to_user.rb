class AddSeenAtToUser < ActiveRecord::Migration
  def self.up
   add_column :users, :seen_at, :string
  end

  def self.down
  end
end
