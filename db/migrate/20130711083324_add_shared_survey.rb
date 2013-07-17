class AddSharedSurvey < ActiveRecord::Migration
  def self.up
    add_column :users, :shared_survey, :integer
  end

  def self.down
  end
end
