class ChangeNotCompletedToString < ActiveRecord::Migration
  def self.up
	change_column :users, :not_completed, :string
  end

  def self.down
  end
end
