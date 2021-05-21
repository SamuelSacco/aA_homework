class Simon
    COLORS = %w(red blue green yellow)
  
    attr_accessor :sequence_length, :game_over, :seq
  
    def initialize
      @sequence_length = 1
      @game_over = false
      @seq = []
    end
  
    def play
      until game_over
        take_turn
        system("clear")
      end
      game_over_message
      reset_game
    end
  
    def take_turn
      show_sequence
      require_sequence
      unless @game_over
        round_success_message
        @sequence_length += 1
      end
    end
  
    def show_sequence
      add_random_color
      @seq.each do |color|
        puts color
        sleep(0.75)
        system("clear")
        sleep(0.25)
      end
    end
  
    def require_sequence
      puts "enter r, b, g, or y in order separated by a space"
      guess = gets.chomp.split(" ")
      @seq.map { |color| color[0] }.each_with_index do |color_char, i|
        @game_over = true if color_char != guess[i]
      end
    end
  
    def add_random_color
      @seq << COLORS.sample
    end
  
    def round_success_message
      puts "you passed round #{@sequence_length}"
    end
  
    def game_over_message
      puts "better luck next time, noob!"
    end
  
    def reset_game
      @sequence_length = 1
      @game_over = false
      @seq = []
    end
  end
  
  s = Simon.new
  s.play