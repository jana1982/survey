# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def character_count(field_id, update_id, options = {})
      function = "$('#{update_id}').innerHTML = $F('#{field_id}').length;"
      out = javascript_tag(function) # set current length
      out += observe_field(field_id, options.merge(:function => function)) # and observe it
  end
  
  def displayed_person
        text = ""
        if !@user.seen_person 
            text = 'Friend'
        else
            text = @user.leader_text
        end
  end
   
  def minutes
    @user.experiment_time.to_i/60
  end

  def text
    text = %Q<1.\n2.\n3.\n...>
  end
  
  
end
