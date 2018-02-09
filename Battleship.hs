import Control.Exception
import Prelude hiding(catch)
import System.Exit
--import System.Random  

type Board = [[Square]]

data Square = Empty | Ship Int | Hit | Miss

type MyShip = ([(Int, Int)], Int) 

type Move = (Int, Int) 

ship1 a b = ([(a, b), (a+1, b)], 1)
ship2 a b = ([(a, b), (a, b+1)], 2)
ship3 a b = ([(a, b), (a, b+1)], 3)
ship4 a b = ([(a, b), (a, b+1), (a, b+2)], 4)
ship5 a b = ([(a, b), (a+1, b ), (a+2, b)], 5)
ship6 a b = ([(a, b), (a+1, b ), (a+2, b), (a+3, b)], 6)
ship7 a b = ([(a, b), (a, b+1 ), (a, b+2), (a, b+3), (a, b+4)], 7) 

ships = [ship1, ship2, ship3, ship4, ship5, ship6, ship7]     


{- main 
   Runs the game.
-}
main :: IO ()
main = do
	putStrLn "Welcome to Battleship! Try to shoot down your opponent's ships! There are seven in total."
    gameBoard1 <- genGameBoard  
    gameBoard2 <- genGameBoard  
    play gameBoard1 gameBoard2  


{- play gameBoard1 gmaeBoard2
   
   PRE: gameBoard1 and gameBoard2 are valid and not in a winning state
   Side-effects: Switches between players' boards and updates after moves
-}
play gameBoard1 gameBoard2 = do 
    putStrLn "Go player one"
    newGameBoard2 <- player gameBoard2
    putStrLn "Go player two"
    newGameBoard1 <- player gameBoard1
    play newGameBoard1 newGameBoard2


{- player gameBoard
   Play the game.
   PRE: gameBoard is valid
   Side-effects: The game interaction
-}
player gameBoard = do
	printBoard gameBoard
	move <- checkMove
	if hitShip gameBoard move then do.   -- la till argumenten gameBoard och move
		if win gameBoard then
			putStrLn "Congratulations! You Won!"
			putStrLn "Play again?"
			rematch
		else
			if sunkShip gameBoard move then
                putStrLn "Great! You sank the whole ship, keep going!"
                player (updateBoard gameBoard move)
		    else
		     	putStrLn "Nice shot! Try again."
		        player (updateBoard gameBoard move)
  else if alreadyHit gameBoard move then    -- la till funktion ifall man redan träffat
          putStrLn "You already hit that one, try again!" -- rutan så får man köra igen
          player gameBoard
	else return (updateBoard gameBoard move)
		    
alreadyHit :: Board -> Move -> Bool
alreadyHit board (row,num) =
  ((board !! row) !! num) == Miss || ((board !! row) !! num) == Hit 



{- rematch
   Restarts or exits the game.
   PRE: a valid input
   Side-effects: Reads a line from input, 
-}
rematch = do
	putStrLn "Play again? (y/n)"
	response <- getLine
	if response == y then
		main 
	else return ()  


{- hipShip gameBoard move
   Determines whether a move is a hit or a miss.
   PRE: move is a valid input
   RETURNS: true if the chosen square contains a boat, else false
   EXAMPLES: 
-}
hitShip :: Board -> Move -> Bool
hitShip gameBoard move = ((gameBoard !! (fst move)) !! (snd move)) == (Ship _) 


{- checkMove 
   Checks if a move is valid.
   RETURNS: A move object
   Side-effects: Reads a line from input
-}
checkMove :: IO Move
checkMove = do
	catch (do
    line <- getLine 
    evaluate (read line)) 
    ((\_ -> do   
       putStrLn "Invalid move. Correct format: (row, column)"
       readMove) :: SomeException -> IO Move) 


{- win gameBoard
   Checks if the board is in a winning state with no more boats to hit
   PRE: 
   RETURNS: true if gameboard contains no more unhit boats, else false
   EXAMPLES: 
-}
win :: Board -> Bool
win gameboard = undefined


{- printBoard
   Prints the game board
   Side-effects: Prints the board 
 -}
printBoard :: IO ()
printBoard = undefined


{- genGameBoard ships
   PRE:
   RETURNS:
   EXAMPLES:
   VARIANT:
-}
genGameBoard :: [MyShip] -> Board  
genGameBoard ships = undefined


{- updateBoard gameBoard move
   PRE:
   RETURNS:
   EXAMPLES:
-}
updateBoard :: Board -> Move -> Board
updateBoard gameBoard move = undefined 


{- sunkShip
   PRE: 
   RETURNS:
   EXAMPLES:
-}
sunkShip :: Board -> Move -> Bool
sunkShip gameBoard move = undefined


-- spelplanen som spelarna ser (_ = inget drag, x = miss, o = träff)
interpretSquares = undefined   


-- ruta ändras till miss/hit
changeState = undefined


-- för att se att man träffat hela sheppet
checkneighbours = undefined