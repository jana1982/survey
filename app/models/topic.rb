class Topic < ActiveRecord::Base
  belongs_to :user
  acts_as_list :scope => user, order => :position

end
