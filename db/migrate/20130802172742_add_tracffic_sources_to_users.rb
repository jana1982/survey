class AddTracfficSourcesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :referrer, :text
    add_column :users, :traffic_source, :string
    add_column :users, :traffic_keywords, :string
  end

  def self.down
  end
end
