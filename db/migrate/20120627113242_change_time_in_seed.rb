class ChangeTimeInSeed < ActiveRecord::Migration
  def self.up
    change_column :seeds , :time, :datetime
  end

  def self.down
  end
end
