class ChangeInterestVars2InUsers < ActiveRecord::Migration
  def self.up
    rename_column :users, :def_neg, :econ_gen
    rename_column :users, :def_oth, :econ_sent
    
    rename_column :users, :dip_neg, :for_gen
    rename_column :users, :dip_oth, :for_sent
    
    rename_column :users, :ele_neg, :dom_gen
    rename_column :users, :ele_oth, :dom_sent
    
    rename_column :users, :esp_neg, :leg_gen
    rename_column :users, :esp_oth, :leg_sent
    
    rename_column :users, :for_neg, :fisc_gen
    rename_column :users, :for_oth, :fisc_sent
    
    rename_column :users, :gov_neg, :soc_gen
    rename_column :users, :gov_oth, :soc_sent
    
    rename_column :users, :hum_neg, :agr_gen
    rename_column :users, :hum_oth, :agr_sent
    
    rename_column :users, :loc_neg, :def_gen
    rename_column :users, :loc_oth, :def_sent
    
    rename_column :users, :parl_neg, :fam_gen
    rename_column :users, :parl_oth, :fam_sent
    
    rename_column :users, :refu_neg, :health_gen
    rename_column :users, :refu_oth, :health_sent
    
    rename_column :users, :auth_neg, :traf_gen
    rename_column :users, :auth_oth, :traf_sent
    
    rename_column :users, :bud_neg, :env_gen
    rename_column :users, :bud_oth, :env_sent
    
    rename_column :users, :tre_neg, :educ_gen
    rename_column :users, :tre_oth, :educ_sent
    
    rename_column :users, :cons_neg, :dev_gen
    rename_column :users, :cons_oth, :dev_sent
    
    remove_column :users, :int_neg
    remove_column :users, :int_oth    
    remove_column :users, :part_neg
    remove_column :users, :part_oth
    remove_column :users, :mig_neg
    remove_column :users, :mig_oth
    remove_column :users, :cit_neg
    remove_column :users, :cit_oth
    remove_column :users, :refe_neg
    remove_column :users, :refe_oth
    remove_column :users, :nuc_neg
    remove_column :users, :nuc_oth
    remove_column :users, :lob_neg
    remove_column :users, :lob_oth
    remove_column :users, :oth_oth_txt
    
    
  end

  def self.down
  end
end
