class TopicsController < ApplicationController

def show
@topic = Topic.find(params[:id])
end

def update
 @topic = Topic.find(params[:id])
 if(@topic.position > params[:list][:position].to_i)
   Topic.find(:all, :conditions => ["position >= ? AND position < ?", params[:topic][:position],@topic.position]).each {|c| c.update_attribute(:position, c.position + 1)}
 else
   Topic.find(:all, :conditions => ["position <= ? AND position > ?", params[:topic][:position],@topic.position]).each {|c| c.update_attribute(:position, c.position - 1)}
 end
if
@topic.update_attributes(params[:topic])
redirect_to :action => 'topic'
else
redirect_to :action => 'edit', :id => params[:id]
end
end

def create
  @topic = Topic.new(params[:topic])
  if @topic.save and @topic.insert_at(params[:topic][:position])
    flash[:notice] = 'List was successfully created.'
    redirect_to :action => 'list'
  else
    render :action => 'new'
end
end

def update_positions
  params[:sortable_list].each_with_index do |id, position|
    Topic.update(id, :position => position+1)
  end

  @topics = Topic.find(:all, :order => :position )
  render :layout => false , :action => :reorder
end

def reorder
 @topics = Topic.find(:all, :order => :position )
end

<div id="topics">
  <ul id="sortable_list">
  <% @topics.each do |topic| %>
     <li id="">"><%= topic.name %></li>
  <% end %>
  </ul>
  <%= link_to 'Topic Page', :action => 'topic' %>
</div>
<%= sortable_element('sortable_list', :update => 'topics',:complete => visual_effect(:highlight, 'sortable_list'),:url => {:action => :update_positions}) %>
  