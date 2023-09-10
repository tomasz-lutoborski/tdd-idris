import Data.Vect

allLengths : List String -> List Nat
allLengths [] = []
allLengths (word :: words) = length word :: allLengths words

isEven : Nat -> Bool
isEven 0 = True
isEven (S k) = not (isEven k)

allLengths' : Vect len String -> Vect len Nat
allLengths' [] = []
allLengths' (word :: words) = length word :: allLengths' words
