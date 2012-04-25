class AddSearchToUser < ActiveRecord::Migration
  def self.up
   add_column :users, :search, :string
  end

  def self.down
  end
end
