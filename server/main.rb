# encoding: utf-8
require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require_relative '../lib/device'

get '/' do
  @devices = Device.all
  erb :index
end

get '/devices/on' do
  Devices.all.turn_on
  redirect '/'
end

get '/devices/off' do
  Device.all.turn_off
  redirect '/'
end

get '/devices/:id/on' do
  Device.find(params[:id]).turn_on
  redirect '/'
end

get '/devices/:id/off' do
  Device.find(params[:id]).turn_off
  redirect '/'
end

helpers do
  def on_or_off(status)
    (status == :on) ? 'p&aring;' : 'av'
  end
end