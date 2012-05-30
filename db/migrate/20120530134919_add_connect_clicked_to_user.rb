class AddConnectClickedToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :connect_clicked, :integer
  end

  def self.down
  end
end
