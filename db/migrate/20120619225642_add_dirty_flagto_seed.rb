class AddDirtyFlagtoSeed < ActiveRecord::Migration
  def self.up
    add_column :seeds, :dirty, :boolean
  end

  def self.down
  end
end
