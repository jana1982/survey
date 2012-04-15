class ChangeRetweetCodingtoIntegers < ActiveRecord::Migration
  def self.up
    rename_column :users, :retweed_clicked, :retweet_clicked
  	change_column :users , :retweet_clicked , :integer
  end

  def self.down
  end
end
