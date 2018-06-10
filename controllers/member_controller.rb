require('sinatra')
require('sinatra/contrib/all')
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
  @members = Member.find(params['id'])
  erb (:"members/show")
end

get '/member/:id/edit' do #edit
  @member = Gymclass.find(params[:id])
  erb (:"edit")
end

post '/member/:id' do #create new member
  Member.new(params).save
  redirect to '/members'
end

post '/member/:id' do #update
  Member.new(params).update
  redirect to "member/#{params['id']}"
end

post '/member/:id/delete' do #delete
  Member.delete(params[:id])
  redirect to '/members'
end 
