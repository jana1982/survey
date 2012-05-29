# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def character_count(field_id, update_id, options = {})
      function = "$('#{update_id}').innerHTML = $F('#{field_id}').length;"
      out = javascript_tag(function) # set current length
      out += observe_field(field_id, options.merge(:function => function)) # and observe it
  end

    def opinion_leader
    a = [@user.ol_1, @user.ol_2, @user.ol_3, @user.ol_4, @user.ol_5, @user.ol_6, @user.ol_7, @user.ol_8, @user.ol_9, @user.ol_10, @user.ol_11, @user.ol_12 ]
    b = Hash.new(0)
    
    a.each do |v|
    b[v] += 1
    end
    
    b.each do |k, v|
    puts "#{k} appears #{v} times"
    end
    
    c= b.max { |a,b| a.last <=> b.last }.first
    session[:user_params].deep_merge!({:leader_text => c})
    
    end
    
   
  def minutes
 
  @user.experiment_time.to_i/60
   
  end
end
