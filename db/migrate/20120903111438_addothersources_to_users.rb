class AddothersourcesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :other_sources, :integer
    add_column :users, :other_sources_txt, :string
  end

  def self.down
  end
end
