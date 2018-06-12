require('sinatra')
require('sinatra/contrib/all')
require("pry-byebug")
require_relative('../models/member.rb')
also_reload('../models/*')

get '/members' do
  @members = Member.all()
  erb (:"members/index")
end

get '/members/new' do #new
  @members = Member.all()
  erb (:"members/new")
end

get '/members/:id' do #show
  @members = Member.find(params['id'].to_i)
  erb (:"members/show")
end

get '/member/:id/edit' do #edit
  @member = Member.find(params[:id])
  erb (:"members/edit")
end

post '/members' do #create new member
  Member.new(params).save
  redirect to '/members'
end

post '/members/:id' do #update
  Member.new(params).update
  redirect to "members/#{params['id']}"
end

post '/members/:id/delete' do #delete
  Member.delete(params[:id])
  redirect to '/members'
end
