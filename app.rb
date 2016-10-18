require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require 'sqlite3'

enable :sessions

configure :development do
  set :database, 'sqlite3:db/database.db'
end 
require './models'


$menu = [
	    {page: 'Home', href: '/'},
	    {page: 'Profile', href: '/profile'},
	    {page: 'Account', href: '/account'},
	    {page: 'Feed', href: '/feed'},
	    {page: 'Teammates', href: '/teammates'},
	    {page: 'Sign Out', href: '/sign_out'}
  	]

  get '/' do 
 	erb :home
 end