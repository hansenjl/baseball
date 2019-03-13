class CLI

  def start #what should happen only 1 time
    puts "Welcome to KC Baseball Scores!"
    Scraper.scrape_games
    main_menu
  end


  def main_menu
    puts "\nWould you like to see the upcoming game schedule or the results of past games?"
    puts "Type 'past' for past games and 'future' for upcoming games.\n"
    puts "Type 'exit' to Exit."
    input = gets.strip
    if input == "past"
      #call a method to show the games in the past
      past_games
    elsif input == "future"
      #call a method to show games in the future
      upcoming_games
    elsif input == "exit"
      goodbye
    else
      puts "I'm sorry, I didn't understand that command."
      main_menu
    end
  end

  def upcoming_games
    puts "\nHere are the upcoming games:"
    list_upcoming_games
    main_menu
  end

  def list_upcoming_games
    Game.upcoming_games.each do |game|
      puts "\n  The Royals will play the #{game.team} on #{game.date}"
    end
  end

  def past_games
    puts "\nHere are the previous games in order from most recent:\n"
    list_past_games
    ask_user_if_they_want_more_info
  end

  def ask_user_if_they_want_more_info
    puts "Would you like to see more info on any of the games listed?"
    puts "If so, type 'yes' or 'y'."
    puts "Otherwise, type 'no' or 'n' to return to the main menu and 'exit' to quit"
    input = gets.strip.downcase
    case input
    when 'y','yes', 'yeah'
      get_game_choice
    when 'n', 'no'
      main_menu
    when 'exit', 'quit'
      goodbye
    else
      puts "Sorry I don't understand that command."
      ask_user_if_they_want_more_info
    end
  end

  def get_game_choice
    list_past_games
    puts "\nWhich game do you want more info on? Type in the number next to that game\n"

    input = gets.strip.to_i
    if input.between?(1,Game.previous_games.length)
      game = Game.previous_games[input - 1]
      Scraper.scrape_more_details(game)
      display_game_details(game)
    else
      puts "I'm sorry, I don't understand that command"
      get_game_choice
    end
  end

  def display_game_details(game)
    #puts out more details about each game
    puts "more details about #{game.team}"
  end

  def list_past_games
    Game.previous_games.each.with_index(1) do |game, idx|
      puts "\n#{idx}. The Royals #{game.outcome} against the #{game.team} when they were #{game.home_or_away}"
      puts "The score was #{game.score}"
    end
  end

  def goodbye
    puts "Goodbye! Have a nice day! :)"
    exit(1)
  end
end