twice : (a -> a) -> a -> a
twice f x = f (f x)

Shape : Type
rotate : Shape -> Shape
double : Num a => a -> a

quadruple : Num a => a -> a
quadruple = twice double

turn_around : Shape -> Shape
turn_around = twice rotate
