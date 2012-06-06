class AddFavoriteUndRetweetClicked2ToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :favorite_at_clicked, :integer
    add_column :users, :retweet_at_clicked, :integer
  end

  def self.down
  end
end
