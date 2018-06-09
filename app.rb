require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/gymclass_controller.rb')
require_relative('controllers/member_controller.rb')
require_relative('controllers/signed_up_controller')

get '/' do
  erb(:index)
end
