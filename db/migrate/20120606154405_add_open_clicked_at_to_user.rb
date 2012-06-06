class AddOpenClickedAtToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :open_clicked_at, :integer
  end

  def self.down
  end
end
