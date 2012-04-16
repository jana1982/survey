class AddEmploymentTextToUsers < ActiveRecord::Migration
  def self.up
	add_column :users, :employment_text, :string
  end

  def self.down
  end
end
