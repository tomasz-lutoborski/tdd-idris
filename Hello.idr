module Main

main : IO ()
main = putStrLn (cast 'x')

StringOrInt : Bool -> Type
StringOrInt x = case x of
        True => String
        False => Int
        
getStringOrInt : (x : Bool) -> StringOrInt x
getStringOrInt x = case x of
        True => "Hello"
        False => 5
        
valToString : (x : Bool) -> StringOrInt x -> String
valToString x y = case x of
        True => ?xtrue
        False => ?xfalse
