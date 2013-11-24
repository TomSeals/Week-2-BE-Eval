require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../tennis'

describe Tennis::Game do
  let(:game) { Tennis::Game.new }

  describe '.initialize' do
    it 'creates two players' do
      expect(game.player1).to be_a(Tennis::Player)
      expect(game.player2).to be_a(Tennis::Player)
    end

    it 'sets the opponent for each player' do
      expect(game.player1.opponent).to eq(game.player2)
      expect(game.player2.opponent).to eq(game.player1)
    end
  end

  describe '#wins_ball' do
    it 'increments the points of the winning player' do
      game.wins_ball(1)
      expect(game.player1.points).to eq(1)
    end
  end

  # Tests score class method
  describe '.score' do
    context 'when both players have the same score' do
      it 'returns love all' do
        expect(game.score).to eq('love all')
      end 

      it 'returns fifteen all' do
        expect(game.score).to eq('fifteen all')
      end 

      it 'returns thirty all' do
        expect(game.score).to eq('thirty all')
      end 

      it 'returns forty all' do
        expect(game.score).to eq('forty all')
      end

      it 'returns DUECE' do
        expect(game.score).to eq('DUECE')
      end
    end
  
    context 'player1 has the advantage' do
      it 'returns AD player1' do
        expect(game.score).to eq('AD player1')
      end 
    end

    context 'player2 has the advantage' do
      it 'returns AD player2' do
        expect(game.score).to eq('AD player2')
      end 
    end

    context 'unequal scores before duece' do
      it 'returns the score of player1 and player2' do
        expect(game.score).to eq('player1: fifteen, player2: thirty')
      end
    end

    context 'somebody wins a game!' do
      it 'returns a win with the winner' do
        expect(game.score).to eq('player2 wins the game!')
      end
    end
  end
end



describe Tennis::Player do
  let(:player) do
    player = Tennis::Player.new
    player.opponent = Tennis::Player.new

    return player
  end

  describe '.initialize' do
    it 'sets the points to 0' do
      expect(player.points).to eq(0)
    end 
  end

  describe '#record_won_ball!' do
    it 'increments the points' do
      player.record_won_ball!
      expect(player.points).to eq(1)
    end
  end

  #tests the instance method to reveal a player's score
  describe '#score' do
    context 'when points is 0' do
      it 'returns love' do
        expect(player.score).to eq('love')
      end
    end

    context 'when points is 1' do
      it 'returns fifteen' do
        player.points = 1
        expect(player.score).to eq('fifteen')
      end 
    end
    
    context 'when points is 2' do
      it 'returns thirty' do
        player.points = 2
        expect(player.score).to eq('thirty')
      end
    end
    
    context 'when points is 3' do
      it 'returns forty' do
        player.points = 3
        expect(player.score).to eq('forty')
      end
    end
  end
end