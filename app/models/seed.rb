class Seed < ActiveRecord::Base
    
  serialize :content
  
  def self.get_random_from_last_batch
    highest_batch = Seed.all.max_by{|s| s.batch_id}.batch_id
    seeds = Seed.find_all_by_batch_id(highest_batch)
    seed = seeds[rand(seeds.length)]
  end
  
end