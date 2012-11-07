class FurtherOpenVariablesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :open_reasons_others, :string
  end

  def self.down
  end
end
