import Data.Vect

insert : Ord el => (x : el) -> (xsSorted : Vect n el) -> Vect (S n) el
insert x [] = [x]
insert x (y :: xs) = case x < y of
                          False => y :: insert x xs
                          True => x :: y :: xs

myLength : List a -> Nat
myLength [] = 0
myLength (x :: xs) = 1 + myLength xs

myReverse : List a -> List a
myReverse [] = []
myReverse (x :: xs) = myReverse xs ++ [x]

myMap : (a -> b) -> List a -> List b
myMap f [] = []
myMap f (x :: xs) = f x :: myMap f xs

insSort : Ord el => Vect n el -> Vect n el
insSort [] = []
insSort (x :: xs) = let xsSorted = insSort xs in
                        insert x xsSorted
