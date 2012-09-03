class AddSelfAggrNewsToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :blogs, :integer
    add_column :users, :search_engine, :integer
    add_column :users, :goverment_site, :integer
    add_column :users, :community_site, :integer
  end

  def self.down
  end
end
