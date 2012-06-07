class AddThemenToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :seen_themen, :string
  end

  def self.down
  end
end
