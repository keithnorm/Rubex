require 'sinatra'

Sinatra::Application.set :env, :production
Sinatra::Application.set :raise_errors, true

log = File.new("sinatra.log", "a+")
STDOUT.reopen(log)
STDERR.reopen(log)

 
require 'rubex.rb'
run Sinatra::Application