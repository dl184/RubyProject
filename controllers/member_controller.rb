require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/members' do
  @members = Member.all()
  erb (:"members/index")
end

get '/members/:id' do
  @members = Member.find(params['id'])
  erb(:"members/show")
end

get '/member/:id/edit' do
  @member = Gymclass.find(params[:id])
  (erb :edit)
end

post '/member/:id' do
  Member.new(params).update
  redirect to "member/#{params['id']}"
end
