require 'rubygems'
require 'sinatra'
require "slim"

helpers do
  def show_404
    status 404
    slim :'404'
  end
end

get '/' do
  slim :index
end

not_found do
  show_404
end


