class AddSituationToUser < ActiveRecord::Migration
  def self.up
  add_column :users, :situation, :integer
  end

  def self.down
  end
end
