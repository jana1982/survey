class AddAdditionalCondition < ActiveRecord::Migration
  def self.up
    add_column :users, :seen_nv_influence, :boolean
    add_column :users, :seen_nv_damage, :boolean
    add_column :users, :random_var_multimessage, :boolean
  end

  def self.down
  end
end
