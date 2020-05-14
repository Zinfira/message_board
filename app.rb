require('sinatra')
require('sinatra/reloader')
require('./lib/message_board')
require('pry')
also_reload('lib/**/*.rb')

enable :sessions

get('/') do
  @boards = Board.all 
  erb(:message)
end 

get('/boards') do
  @boards = Board.all
  erb(:message)
end

