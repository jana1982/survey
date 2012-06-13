class AddResultsToUser < ActiveRecord::Migration
  def self.up
        add_column :users, :results, :integer
  end

  def self.down
  end
end
