class Game
  attr_accessor :team, :home, :score, :result, :date
  @@all = []

  ## option 1
  # def initialize(team,score,result,date, home)
  #   @team = team
  #   @score = score
  #   @result = result
  #   @home = home
  #   @date = date

  #   @@all << self
  # end



   ## option 2
#   def initialize(attributes)
#     attributes.each do |key,value|
#       self.send("#{key.to_s}=",value)
#     end

#     # @team = "Royals"
#     # self.team= "Royals"
#     # self.send("team=", "Royals")
#   end


  ## option 3

  # def initialize
  #   @@all << self
  # end

  def self.all
    @@all
  end

end



