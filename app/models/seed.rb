class Seed < ActiveRecord::Base
    
  serialize :content
  #attr_accessible 	:time_setup
  
  def self.get_random_from_last_batch
    highest_batch = Seed.all.max_by{|s| s.batch_id}.batch_id
    
    #Check for seeds that have been marked as dirty because a user has started the questionaire
    #But if the user cancelled it and the seed has been marked dirty for more than 5 hours reset it     
    dirty_seeds = Seed.all(:conditions => ["batch_id = ? AND dirty = ?", highest_batch, true])            
    t = Time.now    
    dirty_seeds.each do |seed|
      if (((t - seed.time_setup)/3600).round > 5)
        seed.dirty = 'false'
       # @user.time_exceed = 'true'
      end
      seed.save!
    end
    
   
    seeds = Seed.all(:conditions => ["batch_id = ? AND dirty = ?", highest_batch, false])            
    seed = seeds[rand(seeds.length)]
  end
  
end