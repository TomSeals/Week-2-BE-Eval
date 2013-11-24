module Tennis
  class Game
    attr_accessor :player1, :player2, :opponent

    # creates two players
    def initialize
      @player1 = Player.new
      @player2 = Player.new
    # sets the opponent for each player
      @player1.opponent = @player2
      @player2.opponent = @player1
    end

    # Records a win for a ball in a game.
    #
    # winner - The Integer (1 or 2) representing the winning player.
    #
    # Returns the score of the winning player. 

    # increments the points of the winning player

    def wins_ball(winner)
      if (winner == 1)
        @player1.points += 1;
      else
        @player2.points += 1;
      end
    end

    def score
    end 
  end


  class Player
    attr_accessor :points, :games, :sets, :opponent

    def initialize
      @points = 0
      @games = 0
      @sets = 0
      @opponent = opponent
    end

    # Increments the score by 1.
    #
    # Returns the integer new score.
    def record_won_ball!
      @points += 1
    end

    # Returns the String score for the player.
    def score 
      return 'love' if @points == 0 
      return 'fifteen' if @points == 1 
      return 'thirty' if @points == 2 
      return 'forty' if @points == 3
    end
  end
end