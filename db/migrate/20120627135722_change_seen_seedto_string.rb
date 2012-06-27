class ChangeSeenSeedtoString < ActiveRecord::Migration
  def self.up
    change_column :users , :seen_seed, :string
  end

  def self.down
  end
end
