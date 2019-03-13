class Game
  attr_accessor :team, :home, :score, :result, :date, :url
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

end



