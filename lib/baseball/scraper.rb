class Scraper

  def self.scrape_games
    url = "http://www.espn.com/mlb/team/_/name/kc/kansas-city-royals"

    website = Nokogiri::HTML(open(url))

    #section has a length of 1
    section = website.css("section.col-a.chk-height")

    #games has a length of 12
    games = section.css("li")  #selecting all of the li tags that hold games

    games.each do |game|
        game_object = Game.new
        home_and_team = game.css("div.game-info").text.split
        game_object.team = home_and_team[1]
        game_object.home = home_and_team[0]
        game_object.date =  game.css("div.game-date").text
        game_object.score = game.css("div.score").text
        game_object.result = game.css("div.game-result").text
        game_object.url = "http://www.espn.com" + game.css("a")[0]['href'] if game.css("a")[0]['href']
    end

  end
end