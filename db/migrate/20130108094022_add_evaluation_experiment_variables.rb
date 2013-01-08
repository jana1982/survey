class AddEvaluationExperimentVariables < ActiveRecord::Migration
  def self.up
    add_column :users, :any_mistakes, :integer
    add_column :users, :mistake_txt, :string
    add_column :users, :act_af_tw, :integer
    add_column :users, :uinf_an_sco, :integer
    add_column :users, :irp_imagine, :integer
    add_column :users, :irp_act, :integer
    add_column :users, :irp_keep, :integer
    add_column :users, :cr_imagine, :integer
    add_column :users, :cr_act, :integer
    add_column :users, :cr_keep, :integer
    
  end

  def self.down
  end
end
