class AddOtherTwitterVariables < ActiveRecord::Migration
  def self.up
    add_column :users, :oth_neg_txt, :string
    add_column :users, :oth_oth_txt, :string
  end

  def self.down
  end
end
