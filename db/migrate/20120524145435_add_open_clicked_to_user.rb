class AddOpenClickedToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :open_clicked, :integer
  end

  def self.down
  end
end
