class AddCountryToUsers < ActiveRecord::Migration
  def self.up
	add_column :users, :country, :integer
  end

  def self.down
  end
end
