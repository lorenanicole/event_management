get '/create_event' do
  erb :create_event
end

post '/create_event' do
  puts "#{params[:starts]}"
  @event = Event.create(creator_id: session[:user_id], name: params[:name], location: params[:location], starts_at: Date.parse(params[:starts]), ends_at: Date.parse(params[:ends]))
  erb :create_event
end

get '/update_event/:event_id' do
  @event = Event.find(params[:event_id])
  erb :update_event
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
