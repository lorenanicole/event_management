post '/profile' do
  # sign-up
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], birthdate: params[:bday])
  if @user.save
    session[:user_id] = @user.id
    redirect '/profile'
  else
    @error = "Invalid email or information missing."
    erb :index
  end
end

post '/sessions' do

  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect '/profile'
  else
    @error = "Invalid email or password."
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect '/'
end


get '/profile' do
  @events_created = User.find(session[:user_id]).created_events
  erb :profile
end


