class AddFurtherTwitterVariables < ActiveRecord::Migration
  def self.up
    rename_column :users, :favorite_oc_important_ck, :avg_read_twtimes
    rename_column :users, :favorite_oc_significant_ck, :def_neg
    rename_column :users, :favorite_oc_meaningful_ck, :def_oth
    rename_column :users, :favorite_oc_relevant, :dip_neg
    rename_column :users, :favorite_oc_meaningful, :dip_oth
    rename_column :users, :favorite_oc_important, :ele_neg
    rename_column :users, :favorite_oc_significant, :ele_oth
    rename_column :users, :favorite_oc_relevant_ck, :esp_neg
    add_column :users, :esp_oth, :integer
    add_column :users, :for_neg, :integer
    add_column :users, :for_oth, :integer
    add_column :users, :gov_neg, :integer
    add_column :users, :gov_oth, :integer
    add_column :users, :hum_neg, :integer
    add_column :users, :hum_oth, :integer
    add_column :users, :loc_neg, :integer
    add_column :users, :loc_oth, :integer
    add_column :users, :parl_neg, :integer
    add_column :users, :parl_oth, :integer
    add_column :users, :part_neg, :integer
    add_column :users, :part_oth, :integer
    add_column :users, :refu_neg, :integer
    add_column :users, :refu_oth, :integer
    add_column :users, :auth_neg, :integer
    add_column :users, :auth_oth, :integer
    add_column :users, :bud_neg, :integer
    add_column :users, :bud_oth, :integer
    add_column :users, :tre_neg, :integer
    add_column :users, :tre_oth, :integer
    add_column :users, :cons_neg, :integer
    add_column :users, :cons_oth, :integer
    add_column :users, :int_neg, :integer
    add_column :users, :int_oth, :integer
    add_column :users, :mig_neg, :integer
    add_column :users, :mig_oth, :integer
    add_column :users, :cit_neg, :integer
    add_column :users, :cit_oth, :integer
    add_column :users, :refe_neg, :integer
    add_column :users, :refe_oth, :integer
    add_column :users, :nuc_neg, :integer
    add_column :users, :nuc_oth, :integer
    add_column :users, :lob_neg, :integer
    add_column :users, :lob_oth, :integer
    add_column :users, :oth_neg, :integer
    add_column :users, :oth_oth, :integer

  end

  def self.down
  end
end
