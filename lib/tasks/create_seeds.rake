desc "This task creates one batch of the random seeds"
task :create_seeds => :environment do
  for i in 1..30 do
    generate_batch3(i)
  end
  for i in 31..60 do
    generate_batch2(i)
  end
  for i in 61..90 do
    generate_batch1(i)
  end
end

task :delete_all_seeds => :environment do 
  Seed.delete_all
end


def generate_batch1(batch_id)
effectvar = [-1,1]
randomarray1=[]
  effectvar.each do |a| # Retweet message 1 or not
    effectvar.each do |b| # Multiple messages or not
      effectvar.each do |c| # Opinion leader or not
        effectvar.each do |d| # At reply or not
           effectvar.each do |e| # News Value influence or not
             
             f = a*b*c*d*e # News Value damage or not confounded with interaction effect ABCDE

             if e==-1 && f==-1
             g=0
             elsif e==-1 && f==1
             g=1
             elsif e==1 && f==-1
             g=2
             elsif e==1 && f==1
             g=3
             end
             
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
             
             if a==-1
             a1 = 0
             else
             a1 = 1
             end
             
             if b==-1
             b1 = 0
             else
             b1 = 1
             end
             
             if c==-1
             c1 = 0
             else
             c1 = 1
             end
             
             if d==-1
             d1 = 0
             else
             d1 = 1
             end
             

             s = Seed.new(:content =>  [a1,b1,c1,d1,g,h], :batch_id => batch_id, :dirty => false)
             s.save!
           end  
        end
      end
    end
  end
end

def generate_batch2(batch_id)
effectvar = [-1,1]
randomarray1=[]
  effectvar.each do |a| # Retweet message 1 or not
    effectvar.each do |b| # Multiple messages or not
      effectvar.each do |c| # Opinion leader or not
        effectvar.each do |d| # At reply or not
           effectvar.each do |e| # News Value influence or not
             
             f = -1*a*b*c*d*e # News Value damage or not confounded with interaction effect ABCDE

             if e==-1 && f==-1
             g=0
             elsif e==-1 && f==1
             g=1
             elsif e==1 && f==-1
             g=2
             elsif e==1 && f==1
             g=3
             end
             
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
             
             if a==-1
             a1 = 0
             else
             a1 = 1
             end
             
             if b==-1
             b1 = 0
             else
             b1 = 1
             end
             
             if c==-1
             c1 = 0
             else
             c1 = 1
             end
             
             if d==-1
             d1 = 0
             else
             d1 = 1
             end
             

             s = Seed.new(:content =>  [a1,b1,c1,d1,g,h], :batch_id => batch_id, :dirty => false)
             s.save!
           end  
        end
      end
    end
  end
end

def generate_batch3(batch_id)
  (0..1).each do |a| # Retweet message 1 or not
    (0..1).each do |b| #Multiple messages or not
      (0..1).each do |c| # Opinion leader or not
       (0..1).each do |d| # At reply or not
           (0..3).each do |e| #Message 1-4
           
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
