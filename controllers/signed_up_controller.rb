require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/gymclass.rb')
require_relative('../models/member.rb')
require_relative('../models/signed_up.rb')
also_reload('../models/*')

get '/signed_up' do
  @signed_up = Signed_up.all()
  erb ( :"signed_up/index" )
end

get '/signed_up/new' do
  @members = Members.all
  @gymclass = Gymclass.all
  erb(:"signed_up/new")
end

post '/signed_up' do
  signed_up = Signed_up.new(params)
  signed_up.save
  redirect to(
    "/signed_up")
  end

  post 'signed_up/:id/delete' do
    Signed_up.destroy(params[:id])
    redirect to ("/signed_up")
  end

  get '/signed_up/:id/edit' do
    @signed_up = Signed_up.find(params[:id])
    (erb :edit)
  end
