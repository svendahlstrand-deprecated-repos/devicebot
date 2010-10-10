# encoding: utf-8
require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require_relative '../lib/home'

get '/' do
  @devices = Home.devices
  erb :index
end

get '/devices/on' do
  Home.turn_on
  redirect '/'
end

get '/devices/off' do
  Home.turn_off
  redirect '/'
end

get '/devices/:id/on' do
  Home.find(params[:id]).turn_on
  redirect '/'
end

get '/devices/:id/off' do
  Home.find(params[:id]).turn_off
  redirect '/'
end

helpers do
  def on_or_off(status)
    (status == :on) ? 'p&aring;' : 'av'
  end
end