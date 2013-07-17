desc "This task refills one batch of the random seeds"
task :refill_seeds => :environment do
  for i in 1..30 do
    generate_batch(i)
  end
end

task :delete_all_seeds => :environment do 
  Seed.delete_all
end


def generate_batch(batch_id)
randomarray1=[]
  (0..1).each do |a| # Retweet message 1 or not
    (0..1).each do |b| # Multiple messages or not
      (0..1).each do |c| # Opinion leader or not
       (0..1).each do |d| # At reply or not
           (0..3).each do |e| # Message 1-4
           
             if b==1 && randomarray1.length ==0
             randomarray1=[0,1]
             h = randomarray1[rand(randomarray1.length)]
             randomarray1.delete(h)
             elsif b==1 && randomarray1.length ==1
             h = randomarray1[0]
             randomarray1.delete(h)
             elsif b==-1
             h = 0
             end
             
             s = Seed.new(:content =>  [a,b,c,d,e,h], :batch_id => batch_id, :dirty => false)
             s.save!
           end  
        end
      end
    end
  end
end
