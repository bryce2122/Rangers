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
	    {page: 'Profile', href: '/users/'},
	    {page: 'Account', href: '/account'},
	    {page: 'Feed', href: '/feed'},
	    {page: 'Teammates', href: '/sample'},
	    {page: 'Sign Out', href: '/signout'}
  	]

  get '/' do 
 	erb :home
 end

get '/' do
	erb :home

end

get '/feed' do
	if session[:id]
	@p = Post.all
	erb :feed
else
	redirect :/
end
end


get '/users/:id' do

@user = User.find_by_id(session[:id])
@b = 7
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
for i in 0..@array.length
	l = @array[i]
	yes = Post.where(user_id: @array[i])
	@m.push(yes)
end

erb :user
end


get '/login' do

	erb :login

end


get '/account' do

    if session[:id]

    erb :account
else
    redirect :/
end


end



get '/signout' do
	session.clear
	redirect :/
	flash[:confirm] = "you are signed out"
end


get '/sample' do
	
if session[:id]
	@samp = Sample.all

	erb :sample

else 
	redirect :/
end

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

post '/sample' do
	@a = params["data_value"];
	@sample = Sample.create(list: @a, user_id: session[:id]);

end

post '/samplefollow' do


    @f = params["data_value"].to_i
    @user = User.find_by_id(@f)
@follow = Follower.new(self: session[:id])
@follow.user = @user
@follow.save


end

post '/update' do

    @user = User.find_by_id(session[:id])

    @user.update_attributes(params)
    flash[:update] = "your account has been updated"
    redirect :account
end


get '/delete' do


    User.find_by_id(session[:id]).destroy
     flash[:update] = "your account has been deleted"
     redirect :/
 end


