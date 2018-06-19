# tictactoe
My first repository on GitHub. 

This is my first attempt at coding a 2 player Tic Tac Toe game. 

d = pd.concat([df['Survived'],pd.get_dummies(df['Pclass']),pd.get_dummies(df['Sex']).loc[:,'male'],pd.get_dummies(df['Name'].apply(lambda x: x.split(', ')[1].split('. ')[0]))],axis=1)
