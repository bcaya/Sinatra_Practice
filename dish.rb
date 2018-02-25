ENV['RACK_ENV'] ||= 'development'
require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym
require 'sinatra/base'
require 'rubygems'
require 'sinatra/activerecord'
require 'sinatra'
require './environments'
require './models/dish'
require_relative 'routes'

class Dishes < Sinatra::Base 
  set :root, File.dirname(__FILE__)
  enable :sessions
  set :public_folder, File.expand_path('../public', __FILE__)
  set :views, Proc.new { File.join(root, "views")}
    register Sinatra::ActiveRecordExtension
  use Rack::MethodOverride
end 

