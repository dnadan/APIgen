#!/usr/bin/env ruby

require 'sinatra'
require 'sinatra/json'
require 'rubygems'
require 'httparty'
require 'base64'

get '/' do
  json "Ask not what your Can can do for you, but what you can do for your Can."
end

#   /inventory
#   GET: List of all items across all scales
get '/inventory' do
  json 'GET /inventory'
end

#   /inventory/scale
#   GET: List of current scale IDs
#   POST: Create new scale ID (e.g. "2")
#   PUT: Change scale to new ID (e.g. "2" -. "ScaleTwo")
get '/inventory/scale' do
  content_type :json
  {
      1 => "scale1",
      2 => "scale2",
      3 => "scale3"
  }.to_json
end

post '/inventory/scale' do
  json 'POST /inventory/scale'
end

put '/inventory/scale' do
  json 'PUT /inventory/scale'
end

#   /inventory/scale/<id>/stock
# 	GET: Current total items on scale id <id>
# 	PUT: Current weight for scale id <id> at timestamp ##:##:##
get '/inventory/scale/:id/stock' do |id|
  json "GET /inventory/scale/#{id}/stock"
end
put '/inventory/scale/:id/stock' do |id|
  json "PUT /inventory/scale/#{id}/stock"
end

#   /inventory/<sku>
#   GET: Total items of type <sku>
#   POST: Create new <sku> item with weight <g>
#   PUT: Update weight of sku
get '/inventory/:sku' do |sku|
  json "GET /inventory/#{sku}"
end
post '/inventory/:sku' do |sku|
  json "POST /inventory/#{sku}"
end
put '/inventory/:sku' do |sku|
  json "PUT /inventory/#{sku}"
end


class YesWeCan
  include HTTParty
  base_uri "https://api.yaas.io/hybris"

  # debug_output $stdout
  default_params :output => 'json'
  format :json
  # http_proxy '10.6.37.15',8080

end