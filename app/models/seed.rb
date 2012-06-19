class Seed < ActiveRecord::Base
    
  serialize :content
  
  def self.get_random_from_last_batch
    highest_batch = Seed.all.max_by{|s| s.batch_id}.batch_id
    #TODO If seeds have been marked as dirty for too long e.g. 5h, then mark them to true and let them be filled out by another user
    Seed.find(:all, :conditions => "batch_id = #{highest_batch} AND dirty = 'false'")
    seeds = Seed.find_all_by_batch_id(highest_batch)
    seed = seeds[rand(seeds.length)]
  end
  
end