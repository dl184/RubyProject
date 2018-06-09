require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/gymclass.rb' )
also_reload( '../models/*' )

get '/gymclass' do
  @gymclass = Gymclass.all()
  erb ( :"gymclass/index" )
end

get '/gymclass/:id' do
  @gymclass = Gymclass.find(params['id'].to_i)
  erb(:"gymclass/show" )
end
