require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/app", __FILE__)
$:.unshift File.expand_path("./../lib/views", __FILE__)
# Les classes dans lib/app :
require_relative 'lib/app/game'
require_relative 'lib/app/player'
require_relative 'lib/app/board'
require_relative 'lib/app/board_case'
# Les classes dans lib/views
require_relative 'lib/app/show'


# --------------------------------------------------------------------------------------
#
# On lance le jeu en créant un objet Application (une instance de la class Application),
# Et on commence par la méthode .perform qui va gérer le jeu (play and replay)
#
# --------------------------------------------------------------------------------------
class Application
  attr_accessor :players
  # Ici on a un tableau de 2 instances de Player
  def initialize
    @players = Array.new
  end


  def display_welcome
    system("clear")
    colorizer = Lolize::Colorizer.new
    colorizer.write " "
    colorizer.write "-=" * 40
    colorizer.write "\n\n\n\n\n"
    colorizer.write "H e l l o   a n d   W e l c o m e   t o   y o u  !".center(80)
    colorizer.write "\n\n\n\n\n"
    colorizer.write "Today is the".center(80)
    colorizer.write "\n\n"
    colorizer.write "M O R P I O N 's".center(80)
    colorizer.write "\n\n"
    colorizer.write "day".center(80)
    colorizer.write "\n\n\n\n"
    colorizer.write "-=" * 40
  end


  # Création des deux joueurs
  def ask_names
    puts " "
    puts "Player 1 (you play with the O), please, enter your name ?"
    print "> "
    name1 = STDIN.gets.chomp.to_s 
    name1 = "Bob" if name1.length <= 0 
    @players << Player.new(name1, "O")

    puts " "
    puts "Player 2 (you play with the X), please, enter your name ?"
    print "> "
    name2 = STDIN.gets.chomp.to_s
    name2 = "Lynda" if name2.length <=0
    @players << Player.new(name2, "X")
  end


  def game_over_display
    colorizer = Lolize::Colorizer.new
    colorizer.write "-=" * 40
    puts "\n\n\n\n\n"
    colorizer.write "  G  A  M  E      O  V  E  R    !  !  !  !".center(80)
    puts "\n\n\n\n\n"
    colorizer.write "-=" * 40
  end


  def stop_game?(default="n", word="")
    puts "\n\n"
    puts "Would you like to play#{word} this funny game ? (y/n)"
    play = STDIN.gets.chomp.to_s
    play = default if play.length <= 0
    return play != "y"
  end


  def perform
    display_welcome

    return if stop_game?("y") # par défault on voudra jouer

    ask_names

    loop do

      # Game.new.perform : Je passe le tableau des players déjà créés
      Game.new(@players).perform
      
      # La partie étant terminée, je demande s'ils veulent rejouer
      game_over_display
      
      break if stop_game?("n", " again") # par défault on veut arrêter

    end
  end
end

Application.new.perform