class Scraper

  def self.scrape_games
    url = "http://www.espn.com/mlb/team/_/name/kc/kansas-city-royals"

    website = Nokogiri::HTML(open(url))

    #section has a length of 1
    section = website.css("section.col-a.chk-height")

    #games has a length of 12
    games = section.css("li")  #selecting all of the li tags that hold games

    games.each do |game|

      ##option 1 - passing in attributes as arguments

      # home_and_team = game.css("div.game-info").text.split
      # team = home_and_team[1]
      # home = home_and_team[0]
      # date =  game.css("div.game-date").text
      # score = game.css("div.score").text
      # result = game.css("div.game-result").text

      # Game.new(team,score,result,date, home)



      ##option 2 - the SEND method

      # attributes = {
      #   team: home_and_team[1],
      #   home: home_and_team[0],
      #   date:  game.css("div.game-date").text,
      #   score: game.css("div.score").text,
      #   result: game.css("div.game-result").text
      # }
      # Game.new(attributes)



      ##option 3 - The Clean Model Method
      ##using the writer/setter method from the scraper

        # game_object = Game.new
        # home_and_team = game.css("div.game-info").text.split
        # game_object.team = home_and_team[1]
        # game_object.home = home_and_team[0]
        # game_object.date =  game.css("div.game-date").text
        # game_object.score = game.css("div.score").text
        # game_object.result = game.css("div.game-result").text
    end

  end
end