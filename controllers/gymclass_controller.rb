require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/gymclass.rb' )
also_reload( '../models/*' )

get '/gymclass' do
  @gymclass = Gymclass.all()
  (erb :"gymclass/index")
end

get '/gymclass/new' do #new class
  @gymclass = Gymclass.all()
  (erb :"gymclass/new")
end

get '/gymclass/:id' do #show class
  @gymclass = Gymclass.find(params['id'].to_i)
  (erb :"gymclass/show")
end

get '/gymclass/:id/edit' do #edit class
  @gymclass = Gymclass.find(params[:id])
  (erb :"gymclass/edit")
end

post '/gymclass/:id' do #create a new gymclass
  Gymclass.new(params).save
  redirect to '/gymclass'
end


post '/gymclass/:id' do #update class
  Gymclass.new(params).update
  redirect to "gymclass/#{params['id']}"
end

post '/gymclass/:id/delete' do #delete class
  Gymclass.delete(params[:id])
  redirect to '/gymclass'
end
