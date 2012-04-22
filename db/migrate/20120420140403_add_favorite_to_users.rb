class AddFavoriteToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :favorite_clicked, :integer
  end

  def self.down
  end
end
