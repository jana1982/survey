class DropTables < ActiveRecord::Migration
  def self.up
    drop_table :opinionleaders
    drop_table :nrreasons
    drop_table :no_retweet_reasons
  end

  def self.down
  end
end
