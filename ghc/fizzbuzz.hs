import System.Environment (getArgs)

main :: IO ()
main = do
    args <- getArgs
    let maxval = if length args > 0 then (read $ head args :: Int) else 100
    mapM_ (putStrLn) [fizzBuzz x | x <- [1..maxval]]

fizzBuzz :: Int -> String
fizzBuzz n
    | n `mod` 15 == 0 = "FizzBuzz"
    | n `mod` 5  == 0 = "Buzz"
    | n `mod` 3  == 0 = "Fizz"
    | otherwise       = show n
