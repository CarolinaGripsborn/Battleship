import Control.Exception
import Prelude hiding(catch)
import System.Exit
--import System.Random  

type Board = [[Square]]

data Square = Empty | Ship Int | Hit | Miss

data GenShip = Vertical Int | Horisontal Int

type MyShip = ([(Int, Int)], Int)  

ship1 = Vertical 2
ship2 = Horisontal 2
ship3 = Horisontal 2
ship4 = Horisontal 3
ship5 = Vertical 3
ship6 = Vertical 4
ship7 = Horisontal 5

ships = [ship1, ship2, ship3, ship4, ship5, ship6, ship7]     


main :: IO ()
main = do
	putStrLn "Welcome to Battleship! Try to shoot down your opponent's ships! There are seven in total."
    gameBoard1 <- genGameBoard  -- make player 1 game board
    gameBoard2 <- genGameBoard  -- make player 2 game board
    play gameBoard1 gameBoard2  -- play the game


play gameBoard1 gameBoard2 = do 
    putStrLn "Go player one"
    newGameBoard2 <- player gameBoard2
    putStrLn "Go player two"
    newGameBoard1 <- player gameBoard1
    play newGameBoard1 newGameBoard2


player gameBoard = do
	printBoard gameBoard
	move <- readMove
	if hitShip  then do
		if win then
			putStrLn "Congratulations! You Won!"
			putStrLn "Play again?"
			rematch
		else
			putStrLn "Nice shot! Try again."
		    player (updateBoard gameBoard move)
	else return (updateBoard gameBoard move)
		    

rematch = do
	putStrLn "Play again? (y/n)"
	response <- getLine
	if response == y then
		main 
	else return ()  


hitShip :: Board -> (Int, Int) -> Bool
hitShip gameBoard move = ((gameBoard !! (fst move)) !! (snd move)) == (Ship _) 


checkMove :: IO Move
checkMove = do
	catch (do
    line <- getLine 
    evaluate (read line)) 
    ((\_ -> do   
       putStrLn "Invalid move. Correct format: (row, column)"
       readMove) :: SomeException -> IO Move) 
 

-- printar spelplan för nästa drag
printBoard 

-- spelplanen som spelarna ser (_ = inget drag, x = miss, o = träff)
interpretSquares = undefined   

-- ruta ändras till miss/hit
changeState = undefined

-- ny spelplan efter ett drag
updateBoard :: Board -> (Int, Int) -> Board
updateBoard = undefined 

-- för att se att man träffat hela sheppet
checkneighbours = undefined