class Game
  attr_accessor :players, :current_player, :board, :status

  def initialize(players)
    @players = players            
    @current_player = @players[0] 
    @board = Board.new
    @status = "on going"
  end


  def game_end
   

    colorizer = Lolize::Colorizer.new
    puts "\n\n"
    colorizer.write " C'est la fin de la partie !".center(80)
    puts "\n\n"
    colorizer.write "-=" * 40

    if @status == "match nul"
      colorizer.write "Et c'est un match nul".center(80)
    elsif @status == "X"
      puts "\n\n"
      colorizer.write "Match remporté par #{@current_player.name} avec ses pions '#{@current_player.pawn_type}'".center(80)
      puts "\n\n"
    elsif @status == "O"
      puts "\n\n"
      colorizer.write "Match remporté par #{@current_player.name} avec ses pions '#{@current_player.pawn_type}'".center(80)
      puts "\n\n"
    elsif @status == "on going"
      puts "\n\n"
      colorizer.write "C'est une partie vraiment nulle 0-0 si ça arrive..."
      puts "\n\n"
    end

  end


  def turn


   
    Show.new(@board).show_board


    while @board.count_turn <= 9


      @players.each do |player|


       
        @current_player = player
        choose_case(@current_player)

  
        @status = @board.victory?


   
        Show.new(@board).show_board

       
        break if @status != "on going" 

      end

    break if @status != "on going" 

    end

 
    game_end

  end



  def choose_case (player)

    if @status == "on going" 

      puts "#{player.name}, avec les pions '#{player.pawn_type}', c'est à toi de jouer !"
      puts "Entre la case que tu souhaites : a1, b2, c3..."
      print "> "

      loop do  
        
        choix = STDIN.gets.chomp.to_s


    
        if ( choix.length == 2 && ( choix =~ /^[1-3][a-c]/ || choix =~ /^[a-c][1-3]/ ) )
          status = @board.write_on_case(choix, @current_player.pawn_type)
          (status != false) ? break : (puts "Cette case est déjà prise, choisissez-en une autre !")
        else
          puts "Merci de choisir une case qui correspond à la grille : a1 ou même 3b si vous voulez..."
        end
      end
    end
  end

  def perform
    puts "\n\n"
    puts "-="*40
    puts "\n\n"

    puts "Début de partie entre :"
    puts "-----------------------"
    puts "- #{@players[0].name} qui joue avec les #{@players[0].pawn_type}".rjust(80)
    puts "                 et".center(80)
    puts "- #{@players[1].name} qui joue avec les #{@players[1].pawn_type}".rjust(80)
    puts " "


    
    turn
    
  end

end