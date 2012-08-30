class AddTradMassMedOfflToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :tv, :integer
    add_column :users, :radio, :integer
    add_column :users, :magazin, :integer
    add_column :users, :newspaper, :integer
  end

  def self.down
  end
end
