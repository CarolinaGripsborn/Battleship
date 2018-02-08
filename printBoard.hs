



startingBoard = do
    rowNumber <- putStrLn "    0   1   2   3   4   5   6   7   8   9  "
    row0 <- putStrLn "0 | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ |"
    row1 <- putStrLn "1 | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ |"
    row2 <- putStrLn "2 | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ |"
    row3 <- putStrLn "3 | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ |"
    row4 <- putStrLn "4 | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ |"
    row5 <- putStrLn "5 | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ |"
    row6 <- putStrLn "6 | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ |"
    row7 <- putStrLn "7 | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ |"
    row8 <- putStrLn "8 | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ |"
    row9 <- putStrLn "9 | _ | _ | _ | _ | _ | _ | _ | _ | _ | _ |"


    interpretRow :: String -> (Int,Int) -> Board -> String

