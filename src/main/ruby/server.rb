#!/usr/bin/env ruby

require 'sinatra'
require_relative 'function'

configure do
  set :port, 8080
end

get '/' do
  STDERR.puts "Function invocation not support with GET"
  status 501
end

post '/' do
  begin
    func = Function.new(ENV['FUNCTION_URI'])
    func.invoke(request.body.read)
  rescue ArgumentError => e
    STDERR.puts e.message
    status 500
  rescue  Exception => e
    STDERR.puts e.message
    status 422
  end
end
