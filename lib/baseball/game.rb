class Game
  attr_accessor :team, :home, :score, :result, :date, :url
  @@all = []

  def initialize
    @@all << self
  end


  def self.all
    @@all
  end

  def win_loss
    self.result == 'L' ? "lost" : "won"
  end

  def self.past_games
    @@all.select{|game| game.date == ""}
  end

  def self.future_games
    @@all.select{|game| game.result == ""}
  end

end



