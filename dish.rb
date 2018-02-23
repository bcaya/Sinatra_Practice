ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym
require_relative 'routes'
require 'rubygems'
require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require './models/dish';

class Dishes < Sinatra::Base 
  set :root, File.dirname(__FILE__)
  enable :sessions
  set :views, Proc.new { File.join(root, "views")}
    register Sinatra::ActiveRecordExtension
  use Rack::MethodOverride
end 

