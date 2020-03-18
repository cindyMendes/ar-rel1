require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require './models/user'
require './models/team'
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "mydb.db")
set :database, {adapter: "sqlite3", database: "mydb.db"}


get '/users1' do 
    @users = User.all
    erb :users1
end 

get '/users2' do 
    @users = User.all
    erb :users2
end 

post '/show_user' do
    @user = User.find_by(name: params[:name])
    if @user.nil?
        return "Users not found"
    end 
    erb :user
end 

get '/user/:id' do
    @user = User.find(params[:id])
    if @user.nil?
        return "Users not found"
    end 
    erb :user
end






get '/teams1' do 
    @teams = Team.all
    @users = User.all
    erb :teams1
end 

get '/teams2' do 
    @teams = Team.all
    erb :teams2
end 

post '/show_team' do
    @team = Team.find_by(name: params[:name])
    if @team.nil?
        return "Teams not found"
    end 
    erb :team
end 

get '/team/:id' do
    @team = Team.find(params[:id])
    if @team.nil?
        return "Teams not found"
    end 
    erb :team
end

