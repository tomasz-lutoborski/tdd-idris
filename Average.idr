module Main

import Data.String
import Data.List
import System.REPL

average : (str : String) -> Double
average str = let numWords = wordCount str
                  totalLength = sum (allLengths (words str)) in
                  cast totalLength / cast numWords
  where
    wordCount : String -> Nat
    wordCount str = length (words str)
    
    allLengths : List String -> List Nat
    allLengths words = map length words
    
showAverage : String -> String
showAverage str = "The average word length is " ++ show (average str) ++ "\n"

main : IO ()
main = repl "Enter a string: " showAverage
