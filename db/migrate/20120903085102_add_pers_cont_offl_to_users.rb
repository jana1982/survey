class AddPersContOfflToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :people_interested, :integer
    add_column :users, :locals, :integer
    add_column :users, :aquaintances, :integer
    add_column :users, :contact_friends, :integer
    add_column :users, :colleagues, :integer
    add_column :users, :experts, :integer
    add_column :users, :contact_ol, :integer
  end

  def self.down
  end
end
