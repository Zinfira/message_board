require 'rspec'
require 'pry'
require 'message_board'

describe '#Board'

  before(:each) do
    Board.clear()
  end
  
  describe('#Board.all') do
    it("returns an empty array when there is no message") do    
      expect(Board.all).to(eq([]))
    end
  end

  describe('#Board.save') do
    it("saves user subject & body input") do
      board1 = Board.new({:subject => "Epicodus", :body => "body goes here", :id => nil})
      board1.save()
      board2 = Board.new({:subject => "Portland", :body => "body goes here", :id => nil})
      board2.save()
      expect(Board.all).to(eq([board1,board2]))
    end
  end

  describe('#==') do
    it ("is the same board if it has the same attributes as another board") do
      board1 = Board.new({:subject => "Epicodus", :body => "body goes here", :id => nil})
      board1 = Board.new({:subject => "Epicodus", :body => "body goes here", :id => nil})
      expect(board1).to(eq(board1))
    end
  end

  describe('.clear') do
    it("clears all boards") do
      board1 = Board.new({:subject => "Epicodus", :body => "body goes here", :id => nil})
      board1.save()
      board2 = Board.new({:subject => "Portland", :body => "body goes here", :id => nil})
      board2.save()
      Board.clear()
      expect(Board.all).to(eq([]))
    end
  end
  describe('.find') do 
    it("finds a board by id") do
    board1 = Board.new({:subject => "Epicodus", :body => "body goes here", :id => nil})
    board1.save()
    board2 = Board.new({:subject => "Portland", :body => "body goes here", :id => nil})
    board2.save()
    expect(Board.find(board1.id)).to(eq(board1))
  end
end
                                      