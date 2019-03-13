class CLI

  def start #things that you want to happen once
    puts "Welcome to the Royals Baseball Scores!"
    Scraper.scrape_games
    main_menu
  end

  def main_menu
    puts "\nDo you want to see scores of the past games?"
    puts "If so, type 'past'."
    puts "Do you want to see games in the future?"
    puts "If so, type 'future'."
    puts "Type 'exit' to exit."
    input = gets.strip.downcase

    # until ['past','future','exit'].include?(input)
    #   puts "\nInput error, please try again."
    #   input = gets.strip.downcase
    # end

    case input
    when 'past'
      show_past_games
    when 'future'
      show_future_games
    when 'exit', 'quit'
      goodbye
    else
      puts "\nInput error, please try again."
      main_menu #recursion
    end
  end


  def show_past_games
    puts "Here are the most recent games played:\n"
    Game.past_games.each.with_index(1) do |game, idx|
      puts "#{idx}. The Royals played #{game.home} the #{game.team} and #{game.win_loss} with a score of #{game.score}"
    end
    puts "\nSelect a number for the game you want more info about."
    input = gets.strip.to_i - 1  #index value 0-18
    max_input = Game.past_games.size - 1
    #check for bad input
    until input.between?(0,max_input)
      puts "Sorry, please enter a number between 1 and #{max_input + 1}"
        input = gets.strip.to_i - 1
    end
    puts "valid input"

    game_object =  Game.past_games[input]
    show_game_details(game_object)

  end

  def  show_game_details(game_object)
    #scrape more details about the game
    Scraper.scrape_game_details(game_object)
    #display the game details
  end

  def show_future_games
    puts "In the future games method"
  end

  def goodbye
    puts "Goodbye! Have a nice day!"
  end
end