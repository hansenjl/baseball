class Game
  attr_accessor :team, :home, :score, :result, :date, :url
  @@all = []

  def initialize
    @@all << self
  end

  def home_or_away
    if self.home == "@"
      "away"
    else
      "home"
    end
  end

  def outcome
    if self.result == "W"
      "won"
    else
      "lost"
    end
  end

  def self.previous_games
    @@all.select{|g| !!g.score}
  end

  def self.upcoming_games
    @@all.select{|g| g.date != ""}
  end

  def self.all
    @@all
  end

end



