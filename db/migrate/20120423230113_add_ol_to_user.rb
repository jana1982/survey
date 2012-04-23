class AddOlToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :leader_text, :string
  end

  def self.down
  end
end
