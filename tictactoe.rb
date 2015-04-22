# This creates a string that will serve as a board. It is 3 X 3, and uses numbers to  
# allow the players to identify the spot they would like to choose on their turn.  

board = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]

# This creates a function that will neatly print the board. It can be printed each time a
# player chooses a space to display an updated version of the board.

def print_board(board)
	print board[0]
	puts
	print board[1]
	puts
	print board[2]
	puts
end

# This function can be run to check if either player has won the game. If there are 
# three X's or O's in a row, then it will return 'true.' This is a boolean that I will
# call in my TicTacToe function, so I also need to initialize the win variable as
# false. 

win = false

def winner(board, win)
	if board[0][0] == board[0][1] and board[0][1] == board[0][2]
		win = true
    elsif board[1][0] == board[1][1] and board[1][1] == board[1][2]
    	win = true
    elsif board[2][0] == board[2][1] and board[2][1] == board[2][2]
    	win = true
    elsif board[0][0] == board[1][0] and board[1][0] == board[2][0]
    	win = true
    elsif board[0][1] == board[1][1] and board[1][1] == board[2][1]
    	win = true
    elsif board[0][2] == board[1][2] and board[1][2] == board[2][2]
    	win = true
    elsif board[0][0] == board[1][1] and board[1][1] == board[2][2]
    	win = true
    elsif board[0][2] == board[1][1] and board[1][1] == board[2][0]
    	win = true
    else
    	win = false
    end
end

# This function will run the 

gameover = false
n = 1

def TicTacToe(board, win, gameover, n)
	puts "Hi TicTacToe players! Your board is below."
	puts "Each number corresponds to an open space for you to place your 'X' or 'O'."
	puts "Good luck!"
	puts
	
    print_board(board)

# This loop will repeat until the 'gameover' boolean is changed to true and the condition 
# is no longer met.
	while gameover == false 
# +1 will be added to the counter after each loop. If the counter is odd, it means 
# it's player 1's turn. If even, it means it's player 2's turn.    
        if n % 2 == 0
            begin
            print "Player 2, choose your space: "
            i = Integer(gets.chomp)
            until i >= 1 and i <= 9 
                print "Error: Please choose a number between 1 and 9: "
                i = Integer(gets.chomp)
            end
            rescue
                print "Error: Please choose a number between 1 and 9: "
                i = Integer(gets.chomp)
            end
            puts
        else 
            begin
            print "Player 1, choose your space: "
            i = Integer(gets.chomp)
            until i >= 1 and i <= 9 
                print "Error: Please choose a number between 1 and 9: "
                i = Integer(gets.chomp)
            end
            rescue
                print "Error: Please choose a number between 1 and 9: "
                i = Integer(gets.chomp)
            end
            puts
        end
        repeat = true
# This loop, inside of the first loop, will check to make sure that the spot has not been
# chosen already. If hasn't been chosen, then it will place an 'X' or 'O' in the spot.
# After a new spot is chosen, it will print the new board. 
        while repeat == true            
            if board[(i-1)/3][(i-1)%3] == "X" or board[(i-1)/3][(i-1)%3] == "O"
                begin
                print "Error: That space is taken, please choose again: "
            	i = Integer(gets.chomp)
            	until i >= 1 and i <= 9 
                    print "Error: Please choose a number between 1 and 9: "
                    i = Integer(gets.chomp)
                end
                rescue
                    print "Error: Please choose a number between 1 and 9: "
                    i = Integer(gets.chomp)
                end
                puts
            else
                if n % 2 == 0
                    board[(i-1)/3][(i-1)%3] = "O"
                    print_board(board)
                else
                    board[(i-1)/3][(i-1)%3] = "X"
            		print_board(board)
            	end
# After each turn, it will check to see if a player has won the game by calling the 
# 'winner' function.
                if winner(board, win) == true
                   	if n % 2 == 0
                        puts "Player 2 wins! Game over."
                        gameover = true
                   	else
                        puts "Player 1 wins! Game over."
                        gameover = true
                    end
                end
# After each turn, it will also check whether the count is at 9. If the count is at 9,
# then all of the spaces have been chosen and the game is a draw.
                if n == 9
                    puts "It's a draw! Game over."
                    gameover = true
                end
                n += 1
                repeat = false
            end
        end
    end
end
# This will run the game when it is opened in the terminal. 
TicTacToe(board, win, gameover, n)
	