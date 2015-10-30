require 'active_record'
require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/flash'

require './users/user.rb'

enable :sessions

get '/' do
	erb :index
end

post '/submit' do
	@user = User.new(params[:user])
	if @user.save
		flash[:notice] = "User created successfully!"
		redirect '/user'
	else
		"Sorry, there was an error!"
	end
end

get '/users' do
	@users = User.all
	erb :users
end

get '/user' do
	@user = User.all.last
	erb :user
end

