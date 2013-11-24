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

    def wins_ball(winner, balls = 1)
      if (winner == 1)
        @player1.points += balls
      else
        @player2.points += balls
      end
    end

    def score
      # cases where both players have an equal amount of points
      if @player1.points == @player2.points
        return 'love all' if @player1.points == 0
        return 'fifteen all' if @player1.points == 1
        return 'thirty all' if @player1.points == 2
        return 'forty all' if @player1.points == 3
        return 'DUECE' if @player1.points > 3
      # cases before DUECE when players have unequal points
      elsif (@player1.points <= 3 && @player2.points <= 3)
        p1_score = @player1.score
        p2_score = @player2.score
        return ('player1: '+ p1_score.to_s + ', player2: ' + p2_score.to_s)
      # cases for DUECE when player has advantage
      elsif (@player1.points - @player2.points == 1)
        return 'Advantage player1'
      elsif (@player1.points - @player2.points == -1)
        return 'Advantage player2'
      # cases for a game won
      elsif (@player1.points - @player2.points > 1)
        @player1.games += 1
          return 'player1 wins the game!'
      else
        @player2.games += 1
          return 'player2 wins the game!'
      end
    end 
  end


  class Player
    attr_accessor :points, :games, :sets, :opponent

    def initialize(opponent: nil)
      @points = 0
      @games = 0
      @sets = 0
      @opponent = opponent
    end

    # Increments the score by 1. Returns the integer new score.
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