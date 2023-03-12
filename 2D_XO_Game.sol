// SPDX-License-Identifier: MIT

pragma solidity 0.8.16;


contract TicTacToeGame {

    address public _playerOne = msg.sender;
    address public _playerTwo = address(0);
    address private _lastPlayed = address(0);
    address public _winner = address(0);
    bool public _isGameOver = false;
    uint8 private _turnsTaken = 0;

    //GameBoard is a 2D array having the location indexes as 
    /*  
        00   01   02
        10   11   12
        20   21   22
    */
    address[3][3] private _gameBoard;

    //Function will start the game by taking the address of the second player. 
    //The address of the first player will be the same one which will initiate the game.
    function startGame(address _player2) external {
        require(_player2 != _playerOne, "Player 1 and player 2 cannot be same. Select a different address for player 2");
        _playerTwo = _player2;
    
    }

    //Function for placing the move of the current player on the game board
    /*
    A player will be allowed to place a move if & only if :
    1. Player-2 address is not empty
    2. Game is not over by draw or winner selection.
    3. Move is made by valid players only.
    4. Mentioned x & y position is within bounds of game board and empty.
    5. It is the turn of the player who is trying to place the move.

    */
    function placeMove(uint8 x, uint8 y) external returns(string memory) {
        
        require (_playerTwo != address(0), 
                "Please mention player-2 and start game. Then you can place a move.");

        require (_turnsTaken != 9, "Game is over. It's a draw");

        require (_winner == address (0), "Game is over because we have a winner.");

        require ((msg.sender == _playerOne) || (msg.sender == _playerTwo), "Invalid player.");

        require ((x >= 0 && x < 3 && y >= 0 && y < 3), 
                "This location does not exist on game board. Please mention x & y within range 0 to 2.");

        require (_gameBoard[y][x] == address(0), "This location is already played.");

        require (msg.sender != _lastPlayed, "Your turn is over. Next player please.");
        
        //Saving the player's address on the required location.
        _gameBoard[y][x] = msg.sender;

        //Saving the current player's address in the last played variable 
        //so as to keep the track of the latest plater which exercised the move
        _lastPlayed = msg.sender;

        //Tracking the number of turns
        _turnsTaken++;
        
        //Checking if the current move has led to a winner
        _winner = isWinner(msg.sender);
        if (_winner != address(0)){
            _isGameOver = true;
            return("Game is over because we have a winner.");
        }

        //For checking if the game is draw
        else if (_turnsTaken == 9){
            _isGameOver = true;
            return("Game is over, its a draw.");
        }
        else {
            return ("Move is placed.");
        }
    }
    
    //Function for checking if we have a winner of the game
    function isWinner(address player) private returns(address) {
        //various winning filters in terms of rows, columns and diagonals
        uint8[2][3][8] memory winningfilters = [
            [[0,0],[0,1],[0,2]],[[1,0],[1,1],[1,2]],[[2,0],[2,1],[2,2]],  // winning row filters
            [[0,0],[1,0],[2,0]],[[0,1],[1,1],[2,1]],[[0,2],[1,2],[2,2]],  // winning column filters
            [[0,0],[1,1],[2,2]],[[0,2],[1,1],[2,0]]                       // winning diagonal filters
        ];
        // Checking if any player matches the winning filters condition
        // Note - In solidity, referencing is done in reverse order (of assigning) for 2D array
        for (uint8 x = 0; x < 8; x++ )
        {
                uint8 a1 = winningfilters[x][0][0];
                uint8 b1 = winningfilters[x][0][1];
                uint8 a2 = winningfilters[x][1][0];
                uint8 b2 = winningfilters[x][1][1];
                uint8 a3 = winningfilters[x][2][0];
                uint8 b3 = winningfilters[x][2][1];

                if ((_gameBoard[a1][b1] == _gameBoard[a2][b2]) && (_gameBoard[a2][b2] == _gameBoard[a3][b3]) &&
                    (_gameBoard[a3][b3] == player))
            
                {
                    _winner = player;
                }
            
        } 
        return (_winner);
        
    }
    
    //String representation of a board row
    function rowToString(uint8 ypos) private view returns (string memory) {
        return string(abi.encodePacked( " | ",getLocationShape(_gameBoard[0][ypos]),
                                    " | ",getLocationShape(_gameBoard[1][ypos]), 
                                    " | ",getLocationShape(_gameBoard[2][ypos]), " | "));
    }

    //Function to view game board
    function viewGameBoard () public view returns (string memory) {
    return (string(abi.encodePacked("\n", 
    rowToString(0), "\n",
    rowToString(1), "\n",
    rowToString(2), "\n")));
}

    //Function for checking the game board location is having the player one's address or player two's address
    function getLocationShape(address addressStored) private view returns(string memory){
        if(addressStored == address(0)){
            return " ";
        } else if(addressStored == _playerOne){
            return "X";
        } else{
            return "O";
        }
    }
}