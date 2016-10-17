require 'sinatra'
require 'sinatra/activerecord'
require 'json'
require 'sqlite3'
require 'sinatra/flash'
enable :sessions

configure :development do
  set :database, 'sqlite3:db/database.db'
end 
require './models'

get '/' do
	erb :home

end

get '/users/:id' do

@user = User.find_by_id(session[:id])


@s.to_s == params[:id]
erb :user
end


get '/login' do

	erb :login

end


post '/sign' do
	puts params["email"]
	
	if User.exists?(email: params["email"]) || User.exists?(username: params["username"])
	flash[:error] = "Email or Username is already taken. Please try again"
	redirect :/

	else


	@user = User.new(email: params["email"],username: params["username"], password: params["password"])
	@user.save

	session[:id] = @user.id
	@s = session[:id]
	redirect '/users/' + @s.to_s 
end

 end 	


post '/login' do

	if User.exists?(email: params["email"]) && User.exists?(password: params["password"])

	@user = User.find_by(email: params["email"], password: params["password"])
	session[:id] = @user.id
	@s = session[:id]
	redirect '/users/' + @s.to_s 


else
	flash[:miss] = "Your username or password was incorrect. Please try again."
	redirect :login;

end


end
