class AddTradMassMedOnlToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :tv_website, :integer
    add_column :users, :tv_sn, :integer
    add_column :users, :tv_mb, :integer
    add_column :users, :tv_rss, :integer
    add_column :users, :tv_newsletter, :integer
    add_column :users, :radio_website, :integer
    add_column :users, :radio_sn, :integer
    add_column :users, :radio_mb, :integer
    add_column :users, :radio_rss, :integer
    add_column :users, :radio_newsletter, :integer
    add_column :users, :magazin_website, :integer
    add_column :users, :magazin_sn, :integer
    add_column :users, :magazin_mb, :integer
    add_column :users, :magazin_rss, :integer
    add_column :users, :magazin_newsletter, :integer
    add_column :users, :newspaper_website, :integer
    add_column :users, :newspaper_sn, :integer
    add_column :users, :newspaper_mb, :integer
    add_column :users, :newspaper_rss, :integer
    add_column :users, :newspaper_newsletter, :integer
  end

  def self.down
  end
end
