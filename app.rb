require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require 'sqlite3'

enable :sessions

configure :development do
  set :database, 'sqlite3:db/database.db'
end 
require './models'