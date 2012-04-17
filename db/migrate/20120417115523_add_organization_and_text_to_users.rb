class AddOrganizationAndTextToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :organization, :integer
    add_column :users, :organization_text, :string
  end

  def self.down
  end
end
