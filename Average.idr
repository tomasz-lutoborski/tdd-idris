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

palindrome : Nat -> String -> Bool
palindrome n str = str == (String.toLower str) && length str > n

counts : String -> (Nat, Nat)
counts str = (length (words str), length str)

topTen : Ord a => List a -> List a
topTen list = take 10 (reverse (sort list))

overLength : Nat -> List String -> Nat
overLength n words = length (filter (\w => length w > n) words)

processInput : String -> String
processInput str = show $ palindrome 5 str
                   
main : IO ()
main = repl "Enter a string: " processInput
