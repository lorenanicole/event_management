require 'pry'

post '/create_event' do
  @event = Event.create(creator_id: session[:user_id], name: params[:name], location: params[:location], starts_at: Date.parse(params[:starts]), ends_at: Date.parse(params[:ends]))
  url = "<a href='/update_event/" + "#{@event.id}" + "'>"
  starts_at = "#{@event.starts_at}"
  content_type :json
  {url: url, name: @event.name, starts: starts_at}.to_json
end

get '/update_event/:event_id' do
  @event = Event.find(params[:event_id])
  if @event.creator_id != session[:user_id]
    redirect '/profile'
  else
    erb :update_event
  end
end

post '/update_event/:event_id' do
  @event = Event.find(params[:event_id])
  @event.update_attributes(name: params[:name], location: params[:location], starts_at: Date.parse(params[:starts]), ends_at: Date.parse(params[:ends]))
  redirect '/profile'
end

get '/delete/:event_id' do
  Event.destroy(params[:event_id])
  redirect '/profile'
end
