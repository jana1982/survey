class AddSelfPresentationToMotivationToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :express_feelings, :integer
    add_column :users, :spread_ideas, :integer
    add_column :users, :argue_ideas, :integer
    add_column :users, :impress_others, :integer
    add_column :users, :enteratain_others, :integer
    add_column :users, :inform_others, :integer
    add_column :users, :center_of_attention, :integer
    add_column :users, :someone_else, :integer
    add_column :users, :show_competence, :integer
    add_column :users, :show_interest, :integer
    add_column :users, :others_expectation, :integer
    add_column :users, :please_others, :integer
    add_column :users, :cover_up_feelings, :integer
    add_column :users, :other_motivations, :integer
    add_column :users, :other_motivation_txt, :string
    
  end

  def self.down
  end
end
