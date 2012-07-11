class AddReasonsForNotRetweetingToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :reason_nrt, :string
    add_column :users, :reason_nfav, :string
    add_column :users, :reason_nrep, :string
    add_column :users, :reason_nexp, :string
    add_column :users, :further_things_to_do, :string
    add_column :users, :further_things_in_simmulation, :string
  end

  def self.down
  end
end
