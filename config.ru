require 'sinatra'

Sinatra::Application.set :env, :production
Sinatra::Application.set :raise_errors, true
 
require 'rubex.rb'
run Sinatra::Application