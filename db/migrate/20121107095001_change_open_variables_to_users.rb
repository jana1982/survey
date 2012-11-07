class ChangeOpenVariablesToUsers < ActiveRecord::Migration
  def self.up
    change_column :users, :open_reasons, :string
  end

  def self.down
  end
end
