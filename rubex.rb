require 'rubygems' 
require 'sinatra'
require 'haml'
require 'sass'
require 'json'

get '/screen.css' do
  headers 'Content-Type' => 'text/css; charset=utf-8'
  sass :screen
end

get '/' do
  haml :index
end

# create
post '/' do
  response = {}
  begin
    regex = %r{#{params[:regex]}}
  rescue Exception => e
    response[:error] = e.message
    return response.to_json
  end
  str = params[:test_string]
  matches = str.match(regex)
  response[:matches] = []
  matches.to_a.each do |match|
    response[:matches].push(match)
  end
  response.to_json
end
