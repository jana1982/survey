class AddTimeToSeed < ActiveRecord::Migration
  def self.up
    add_column :seeds, :time, :float
  end

  def self.down
  end
end
