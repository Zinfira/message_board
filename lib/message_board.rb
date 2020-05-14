require 'pry'

class Board

  attr_reader :id
  attr_accessor :subject, :body
    
  @@boards = {}
  @@total_rows = 0

  def initialize (attributes)
    @subject = attributes.fetch(:subject)
    @body = attributes.fetch(:body)
    @id = id || @@total_rows += 1
  end

  def self.all
    @@boards.values()
  end
  
  def save
    @@boards[self.id] = Board.new({:subject => self.subject, :body => self.body, :id => self.id})
  end

  def ==(board_to_compare)
    self.subject() == board_to_compare.subject()
  end

  def self.clear
    @@boards = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@boards[id]
  end
end


