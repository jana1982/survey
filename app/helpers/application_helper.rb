# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

def character_count(field_id, update_id, options = {})
    function = "$('#{update_id}').innerHTML = $F('#{field_id}').length;"
    out = javascript_tag(function) # set current length
    out += observe_field(field_id, options.merge(:function => function)) # and observe it
end
  
   def write_random_message
  message = ['Message: Schaden 0, Einfluss 0', 'Message: Schaden 1, Einfluss 0', 'Message: Schaden 0, Einfluss 1', 'Message: Schaden 1, Einfluss 1']
  random_message = message[rand(message.length)]
  return random_message
   end
   

 
  
end
