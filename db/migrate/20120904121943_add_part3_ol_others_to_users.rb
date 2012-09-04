class AddPart3OlOthersToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :other_reasons, :integer
    add_column :users, :other_reasons_txt, :string
  end

  def self.down
  end
end
