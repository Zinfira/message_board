require 'pry'

module MessageBoard
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

    def edit (subject, body)
      self.subject = subject
      self.body = body
      # binding.pry
      @@boards[self.id] = Board.new({:subject => self.subject, :body => self.body, :id => self.id})
    end

    def delete()
      @@boards.delete(self.id)
    end
  end



  class Message
    attr_reader :id, :user
    attr_accessor :board_id, :time, :content

    @@messages = {}
    @@total_rows = 0

    def initialize(attributes)
      @user = attributes.fetch(:user)
      @board_id = attributes.fetch(:board_id)
      @time = attributes.fetch(:time)
      @content = attributes.fetch(:content)
      @id = id || @@total_rows += 1
    end


  end
end

