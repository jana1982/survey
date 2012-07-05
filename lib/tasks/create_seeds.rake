desc "This task creates one batch of the random seeds"
task :create_seeds => :environment do
  for i in 1..12 do
    generate_batch(i)
  end
end

task :delete_all_seeds => :environment do 
  Seed.delete_all
end


def generate_batch(batch_id)
  (0..1).each do |a| # Retweet message 1 or not
    (0..1).each do |b| #Multiple messages or not
      (0..1).each do |c| # Opinion leader or not
        (0..1).each do |d| # At reply or not
           (0..3).each do |e| #Message 1-4
             s = Seed.new(:content =>  [a,b,c,d,e], :batch_id => batch_id, :dirty => false)
             s.save!
           end  
        end
      end
    end
  end
end
