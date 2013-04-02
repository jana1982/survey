class OtherSubSourcesToUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :community_site, :self_aggr
    add_column :users, :self_aggr_txt, :string
    add_column :users, :pers_cont_txt, :string
    add_column :users, :trad_media_txt, :string
    
  end

  def self.down
  end
end
