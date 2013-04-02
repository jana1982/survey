class RenameMagazinInUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :magazin, :magazine
    rename_column :users, :magazin_website, :magazine_website
    rename_column :users, :magazin_sn, :magazine_sn
    rename_column :users, :magazin_mb, :magazine_mb
    rename_column :users, :magazin_rss, :magazine_rss
    rename_column :users, :magazin_newsletter, :magazine_newsletter

  end

  def self.down
  end
end
