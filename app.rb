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


$menu = [
	    {page: 'Home', href: '/'},
	    {page: 'Profile', href: '/user'},
	    {page: 'Account', href: '/account'},
	    {page: 'Feed', href: '/feed'},
	    {page: 'Teammates', href: '/teammates'},
	    {page: 'Sign Out', href: '/sign_out'}
  	]

  get '/' do 
 	erb :home
 end

get '/' do
	erb :home

end

get '/users/:id' do

@user = User.find_by_id(session[:id])

@s = session[:id]
@s.to_s == params[:id]
@b = params[:id]
@all = Post.where(user_id: @b)
@self = Follower.where(self: session[:id])

@array = []

@self.each do |s|
	@array.push(s.user_id)

end
@m = []
for i in 1..@array.length
	l = @array[i]
	yes = Post.where(user_id: @array[i])
	@m.push(yes)
end

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


	@user = User.new(email: params["email"],username: params["username"], password: params["password"], followed_id: 1)
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



post '/micro' do 
	@user = User.find_by_id(session[:id])
	session[:id] = @user.id
	@s = session[:id]
	@post = Post.new(params)
	@post.user = @user
	@post.save


	redirect '/users/' + @s.to_s 

end

post '/users/follow' do
@f = params["data_value"].to_i
@user = User.find_by_id(@f)
@follow = Follower.new(self: session[:id])
	@follow.user = @user
	@follow.save
erb :user

end
