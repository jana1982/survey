class ChangeTimeToTimeSetupInSeed < ActiveRecord::Migration
  def self.up
    rename_column :seeds, :time, :time_setup
  end

  def self.down
  end
end
