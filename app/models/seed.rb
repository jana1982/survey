class Seed < ActiveRecord::Base
    has_many :users, :dependent => :destroy
    accepts_nested_attributes_for :users
    
    def generate_batch
    out = []
    (0..1).each do |a|
      (0..1).each do |b|
        (0..1).each do |c|
          (0..1).each do |d|
            (0..1).each do |e|
              (0..3).each do |f|
                out << [a,b,c,d,e,f]
              end
            end
          end
        end
      end
    end
    return  out 
  end
  
  #def last_user
  #  @last_user = User.last
  #end
  
  def b
  end
  #
  #def batch
  #   batch = 0
  #  while true
  #    user.each do |n|
  #      if b == [] or b == nil
  #        puts "Generation of new batch"
  #        batch += 1   
  #        b = generate_batch
  #      end
  #    show = b[rand(b.length)]
  #    puts "Batch #{batch} The user sees #{show}"
  #    session[:user_params].deep_merge!({:situation => show})
  #    b.delete_at(b.index(show))  
  #  end
  #  end
  #end
  
end
