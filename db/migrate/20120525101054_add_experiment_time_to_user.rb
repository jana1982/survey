class AddExperimentTimeToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :experiment_time, :float 
  end

  def self.down
  end
end
