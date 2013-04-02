class Seed < ActiveRecord::Base
    
  serialize :content
  #attr_accessible 	:time_setup
  
  def self.get_random_from_last_batch
    highest_batch = Seed.all.select{|seed| seed.dirty == false}.max_by{|s| s.batch_id}.batch_id
    #Vorher stand:
    #Seed.all.max_by{|s| s.batch_id}.batch_id -> Problem war, dass wenn die Seeds dirty waren und noch nicht gelöscht, dann ist er nicht umgesprungen zum nächsten Batch
    
    #Check for seeds that have been marked as dirty because a user has started the questionaire
    #But if the user cancelled it and the seed has been marked dirty for more than 5 hours reset it
    dirty_seeds = Seed.all(:conditions => ["dirty = ?", true]) 
    #Vorher stand:
    #dirty_seeds = Seed.all(:conditions => ["batch_id = ? AND dirty = ?", highest_batch, true]) -> müssen sich ja nicht im aktuellen highest batch befinden, wenn 11 schon angefangen wird, soll trotzdem 12 untersucht werden           
    t = Time.now    
    dirty_seeds.each do |seed|
      if (((t - seed.time_setup)/3600).round > 5)
        seed.dirty = false
       # @user.time_exceed = 'true'
      end
      seed.save!
    end
    
   
    seeds = Seed.all(:conditions => ["batch_id = ? AND dirty = ?", highest_batch, false])            
    seed = seeds[rand(seeds.length)]
  end
  
end