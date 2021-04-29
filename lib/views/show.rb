class Show
  attr_accessor :bord

  def initialize(board)
      @board = board
  end

  def putcenter(str)
      puts Paint[str, :green].center(80)
  end

  def show_board 
      puts "\n\n\n\n\n"
      putcenter("                             ")
      putcenter(" +       1     2     3      +")
      putcenter("                             ")
      putcenter("   ___|_____|_____|_____|__  ")
      putcenter("      |     |     |     |    ")
      putcenter(" a    |  #{@board.boardcase_array[0].str_value}  |  #{@board.boardcase_array[1].str_value}  |  #{@board.boardcase_array[2].str_value}  |    ")
      putcenter("   ___|_____|_____|_____|__  ")
      putcenter("      |     |     |     |    ")
      putcenter(" b    |  #{@board.boardcase_array[3].str_value}  |  #{@board.boardcase_array[4].str_value}  |  #{@board.boardcase_array[5].str_value}  |    ")
      putcenter("   ___|_____|_____|_____|__  ")
      putcenter("      |     |     |     |    ")
      putcenter(" c    |  #{@board.boardcase_array[6].str_value}  |  #{@board.boardcase_array[7].str_value}  |  #{@board.boardcase_array[8].str_value}  |    ")
      putcenter("   ___|_____|_____|_____|__  ")
      putcenter("      |     |     |     |    ")
      putcenter("                             ")
      putcenter(" +       -     -     -      +")
      puts "\n\n\n\n\n"
      #TO DO : affiche sur le terminal l'objet de classe Board en entrée. S'active avec un Show.new.show_board(instance_de_Board)
    end
  
  
  end