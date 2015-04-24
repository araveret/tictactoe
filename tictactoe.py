def tictactoe():
    print
    print "Hi Tic Tac Toe players! This is your board." 
    print "Each number corresponds to an open space for you to place your 'X' or 'O'."
    print "Good Luck!"
    
    board = [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]

    def print_board():
        print
        print board[0]
        print board[1]
        print board[2]    
    
    print_board()
    gameover = False
    n = 1
    
    while gameover == False:
        try:
            if n % 2 == 0:
                i = input("Player 2, choose your space: ")
            else:
                i = input("Player 1, choose your space: ")
            
            while board[(i-1)/3][(i-1)%3] == 'X'or board[(i-1)/3][(i-1)%3] == 'O':
                i = input("Error: Please choose an open space between 1 and 9: ")
            
            while i < 1 or i > 9:
                i = input("Error: Please choose an open space between 1 and 9: ")
                
            if n % 2 == 0:
                board[(i-1)/3][(i-1)%3] = "O"
                print_board()
            else:
                board[(i-1)/3][(i-1)%3] = "X"
                print_board()
            
            def winner():
                if board[0][0] == board[0][1] and board[0][1] == board[0][2]:
                    return True
                elif board[1][0] == board[1][1] and board[1][1] == board[1][2]:
                    return True
                elif board[2][0] == board[2][1] and board[2][1] == board[2][2]:
                    return True
                elif board[0][0] == board[1][0] and board[1][0] == board[2][0]:
                    return True
                elif board[0][1] == board[1][1] and board[1][1] == board[2][1]:
                    return True
                elif board[0][2] == board[1][2] and board[1][2] == board[2][2]:
                    return True
                elif board[0][0] == board[1][1] and board[1][1] == board[2][2]:
                    return True
                elif board[0][2] == board[1][1] and board[1][1] == board[2][0]:
                    return True
                else:
                    return False            
            
            if winner() == True:
                if n % 2 == 0:                   
                    print "Player 2 wins! Game over."
                    gameover = True
                else:                  
                    print "Player 1 wins! Game over."
                    gameover = True
            elif n == 9:
                print "It's a draw! Game over."
                gameover = True
            n += 1
        except:
            print "Error: Please choose a number between 1 and 9!"
tictactoe()
