require 'rspec'
require 'message_board'
require 'pry'

describe '#Message' do 

  before(:each) do 
    MessageBoard::Board.clear()
    MessageBoard::Message.clear()
    @board1 = Board.new({:subject => "Epicodus", :body => "body goes here", :id => nil})
    @board1.save()
  end
  describe('#==') do 
    it("")
end
    
