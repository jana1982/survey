desc "This task creates a list of Topics"
task :create_topics => :environment do
    generate_topics
end

def generate_topics
             t = Topic.new
             t.name = 'Politics'
             t.id = 1
             t.position = 1
             t.link = 'egal'
             t.save!
             t1 = Topic.new
             t1.name = 'Economics'
             t1.id = 2
             t1.position = 2
             t1.link = 'egal'
             t1.save!
             t2 = Topic.new
             t2.name = 'Cultural topics'
             t2.id = 3
             t2.position = 3
             t2.link = 'egal'
             t2.save!
         
end