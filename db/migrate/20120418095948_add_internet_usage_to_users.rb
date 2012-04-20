class AddInternetUsageToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :private_pc, :integer
    add_column :users, :private_mobile, :integer
    add_column :users, :work_pc, :integer
    add_column :users, :work_mobile, :integer
    add_column :users, :public, :integer
    
  end

  def self.down
  end
end
