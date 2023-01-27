class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(string)
        string.to_i - 1
    end

    def move(position, input)
        @board[position] = input        
    end

    def position_taken?(index)
        @board[index] != " "
    end

    def valid_move?(index)
        index.between?(0, 9) && !position_taken?(index)
    end

    def turn_count
        (@board.filter {|value| value != " "}).length
    end

    def current_player
        turn_count.even? ? "X" : "O"
    end

    def turn
        puts "Specify a position between 1-9"
        game_input = gets.strip
        index = input_to_index(game_input)
        if valid_move?(index)
            choice = current_player
            move(index, choice)
        else
            turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.any? do |three|
            if position_taken?(three[0]) && @board[three[0]] == @board[three[1]] && @board[three[1]] == @board[three[2]]
                return three
            else
                false
            end
        end
    end

    def full?
        @board.all? { |piece| piece != " "}
    end

    def draw?
        full? && !won?
    end

    def over?
        won? || draw?
    end

    def winner
        if set = won?
            @board[set[0]]
        end
    end

    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end