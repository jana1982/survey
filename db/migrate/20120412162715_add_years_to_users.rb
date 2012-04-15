class AddYearsToUsers < ActiveRecord::Migration
  def self.up
	add_column :users, :years, :integer
  end

  def self.down
  end
end
