class ChangeSeedIdInUser < ActiveRecord::Migration
  def self.up
    rename_column :users, :seed_id, :seen_seed
  end

  def self.down
  end
end
