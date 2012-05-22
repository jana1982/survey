# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def character_count(field_id, update_id, options = {})
      function = "$('#{update_id}').innerHTML = $F('#{field_id}').length;"
      out = javascript_tag(function) # set current length
      out += observe_field(field_id, options.merge(:function => function)) # and observe it
  end

    def opinion_leader
    a = Hash.new(0)
    
    ol_list_form.each do |v|
    a[v] += 1
    end
    
    a.each do |k, v|
    puts "#{k} appears #{v} times"
    end
    
    #if @user.ol_1 == @user.ol_2
    #session[:user_params].deep_merge!({:leader_text => @user.ol_1})
    #end
    end
    
end
