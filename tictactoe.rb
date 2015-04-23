
# First thing is first, we need to create the board. It is a 3 X 3 grid, and uses numbers to  
# allow the players to identify which spots they can choose on their turn. There are many 
# ways to write this board, but for ease of calling it later, I split the numbers 
# into three groupings.

board = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]

# This creates a function that will neatly print the board. It can be printed each time a
# player chooses a space to display an updated version of the board. (See how easy it is
# to call each row!)

def print_board(board)
	print board[0]
	puts
	print board[1]
	puts
	print board[2]
	puts
end

# This function can be run to check if either player has won the game. If there are 
# three X's or O's in a row, then it will return 'win = true.' Since 'win' is a boolean 
# that will be called in our TicTacToe function, it needs to be initialized as false. 

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

# This function is the largest and will execute most of the Tic Tac Toe game. It will call the 
# abover functions as needed. Just like above, it has a boolean called 'gameover', which will need 
# to be initialize as 'false'. It also has a counter 'n', which will number how many turns have passed.
# It starts the counter at 1, and adds 1 each time a loop is completed. 

gameover = false
n = 1

def TicTacToe(board, win, gameover, n)

# This is just text that will start the game and print the board to display player one's options.

	puts
    puts "Hi TicTacToe players! Your board is below."
	puts "Each number corresponds to an open space for you to place your 'X' or 'O'."
	puts "Good luck!"
	puts
	
    print_board(board)

# This loop will repeat until the 'gameover' boolean is changed to 'true' and the condition 
# is no longer met. This will be triggered if a player has won the game or if the game is a draw.

	while gameover == false 

# The reason for the 'begin' here, is because we are using 'Integer(gets.chomp)' to record each
# players' move. This will prompt them to enter a value, but will cause an error if they choose a 
# non-integer (i.e. 'g', '10.1'). Typically this would quit the program, but with the 'begin' and 
# later 'rescue' statements, we can stop this from exiting the program and prompt the player to 
# enter a different value.

# Because the counter 'n' starts at one and adds one after each turn, the counter will be odd
# when it is player 1's turn and even when it is player 2's turn. After determining who's turn
# it is, it asks for and collects each player's choice.
    
    begin
        if n % 2 == 0
            print "Player 2, choose your space: "
            i = Integer(gets.chomp)
        else
            print "Player 1, choose your space: "
            i = Integer(gets.chomp)
        end

# This loop will check to make sure that the spot selected above (i = Integer(gets.chomp)) 
# has not previously beed selected. If the space has an 'X' or an 'O' already, then it will 
# give an error message and prompt a new selection.

# The tricky part here was coming up with a formula that worked for all 'i' values that 
# correctly correlated with the space on the grid that the player was attempting to select 
# (i.e. if a player selected '5' that the grid would recognize that selection as board[1][1], 
# or board[0][0] for the selection '1'). The formula below does the trick!
        
        while board[(i-1)/3][(i-1)%3] == "X" or board[(i-1)/3][(i-1)%3] == "O"
            print "Error: Please choose an open space between 1 and 9: "
            i = Integer(gets.chomp)
        end

# This loop will check to make sure that the spot selected above 'i' is a number on the board (1-9).
# If it is not a number 1-9, it will give an error message and prompt a new selection.

        while i < 1 or i > 9
            print "Error: Please choose an open space between 1 and 9: "
            i = Integer(gets.chomp)
        end

# If the selection satisfies the above checks, this statement will put an 'X' or 'O' in the 
# selected spot on the board. As explained above, if the counter is even it will place an 'O'.
# If our counter is odd, it will place an 'X' on the board. It will then print the board, by 
# calling the 'print_board(board)' function from above. 

        if n % 2 == 0
            board[(i-1)/3][(i-1)%3] = "O"
            puts
            print_board(board)
        else
            board[(i-1)/3][(i-1)%3] = "X"
            puts
            print_board(board)
        end
        
# At this point, a turn has taken place. So a few things need to happen: 1) We need to check if
# there is a winner. 2) Check if there is a draw/all of the spaces have been chosen. 3) If neither
# of these things are true, then we need to add one to our counter 'n' so that the program 
# recognizes that the player number has changed. 

# This first 'if' statement checks to see if a player has won the game by calling the 'winner' 
# function. If the function is 'true' it then checks to see who's turn it is and prints the 
# correct player as the winner. It then also defines 'gameover' as 'true' to quit the game.

        if winner(board, win) == true
            if n % 2 == 0
                puts "Player 2 wins! Game over."
                gameover = true
            else
                puts "Player 1 wins! Game over."
                gameover = true
            end

# If no one has won the game, this 'elsif' statement checks to see if all 9 spaces on the 
# board have been filled. It checks this by seeing if 9 turns have taken place (if n == 9).
# If all of the spaces are filled and there is no winner, then it will print a message 
# calling the game a draw and define 'gameover' as 'true' to quit the game.

        elsif n == 9
            puts "It's a draw! Game over."
            gameover = true
        end

# At the end of this loop, here is where the counter adds one to indicate a change of turns.

        n += 1
    
# This is the 'rescue' statement that I spoke about earlier. Paired with the 'begin' statement,
# it prints an error message if a non-integer value is entered by a player. It then restarts 
# the loop without adding one to the counter, giving the player another shot to enter a valid 
# selection to continue the game.

    rescue
        puts "Error: Please choose a number between 1 and 9!"
    end
    end
end

# At the end, we run the TicTacToe function. This will start the game when it is opened 
# in the terminal. 

TicTacToe(board, win, gameover, n)