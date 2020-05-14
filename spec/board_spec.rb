require 'rspec'
require 'pry'
require 'message_board'

describe '#Board' do

  before(:each) do
    MessageBoard::Board.clear()
  end
  
  describe('#Board.all') do
    it("returns an empty array when there is no message") do    
      expect(MessageBoard::Board.all).to(eq([]))
    end
  end

  describe('#Board.save') do
    it("saves user subject & body input") do
      board1 = MessageBoard::Board.new({:subject => "Epicodus", :body => "body goes here", :id => nil})
      board1.save()
      board2 = MessageBoard::Board.new({:subject => "Portland", :body => "body goes here", :id => nil})
      board2.save()
      expect(MessageBoard::Board.all).to(eq([board1,board2]))
    end
  end

  describe('#==') do
    it ("is the same board if it has the same attributes as another board") do
      board1 = MessageBoard::Board.new({:subject => "Epicodus", :body => "body goes here", :id => nil})
      board1 = MessageBoard::Board.new({:subject => "Epicodus", :body => "body goes here", :id => nil})
      expect(board1).to(eq(board1))
    end
  end

  describe('.clear') do
    it("clears all boards") do
      board1 = MessageBoard::Board.new({:subject => "Epicodus", :body => "body goes here", :id => nil})
      board1.save()
      board2 = MessageBoard::Board.new({:subject => "Portland", :body => "body goes here", :id => nil})
      board2.save()
      MessageBoard::Board.clear()
      expect(MessageBoard::Board.all).to(eq([]))
    end
  end
  describe('.find') do 
    it("finds a board by id") do
      board1 = MessageBoard::Board.new({:subject => "Epicodus", :body => "body goes here", :id => nil})
      board1.save()
      board2 = MessageBoard::Board.new({:subject => "Portland", :body => "body goes here", :id => nil})
      board2.save()
      expect(MessageBoard::Board.find(board1.id)).to(eq(board1))
    end
  end

  describe('#edit') do
    it("edit a board by id") do
      board1 = MessageBoard::Board.new({:subject => "Epicodus", :body => "body goes here", :id => nil})
      board1.save()
      board1.edit("Oregon", "body goes here")
      expect(board1.subject).to(eq("Oregon"))
    end
  end
  
  describe("#delete") do 
    it("deletes an board by id") do 
      board1 = MessageBoard::Board.new({:subject => "Epicodus", :body => "body goes here", :id => nil})
      board1.save()
      board2 = MessageBoard::Board.new({:subject => "Portland", :body => "body goes here", :id => nil})
      board2.save()
      board1.delete()
      expect(MessageBoard::Board.all).to(eq([board2]))
    end
  end
  

end
                                      