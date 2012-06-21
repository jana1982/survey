class AddSeedIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :seed_id, :integer
    add_column :users, :batch_id, :integer
  end

  def self.down
  end
end
