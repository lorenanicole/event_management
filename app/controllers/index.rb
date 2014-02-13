require 'open-uri'

get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/pirate' do
  encoded_uri = URI::encode(params[:url])
  translation = open(encoded_uri)
  content_type :json
  {translation: translation, original: params[:sentence]}.to_json
end