class AddEmploymentToUsers < ActiveRecord::Migration
  def self.up
	add_column :users, :employment, :integer
  end

  def self.down
  end
end
