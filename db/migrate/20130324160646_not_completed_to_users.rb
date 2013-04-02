class NotCompletedToUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :self_aggr, :not_completed
  end

  def self.down
  end
end
