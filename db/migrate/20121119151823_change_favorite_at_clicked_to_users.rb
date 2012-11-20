class ChangeFavoriteAtClickedToUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :favorite_at_clicked, :search_clicked
    
  end

  def self.down
  end
end
