import Data.Vect

addRow : Num numType => Vect cols numType -> Vect cols numType -> Vect cols numType
addRow [] [] = []
addRow (x :: xs) (y :: ys) = (x + y) :: addRow xs ys

addMatrix : Num numType => 
            Vect rows (Vect cols numType) -> 
            Vect rows (Vect cols numType) -> 
            Vect rows (Vect cols numType)
addMatrix [] [] = []
addMatrix (x :: xs) (y :: ys) = addRow x y :: addMatrix xs ys

multMatrix : Num numType => 
            Vect n (Vect m numType) -> 
            Vect m (Vect p numType) -> 
            Vect n (Vect p numType)
            
createEmpties : {n : _} -> Vect n (Vect 0 el)
createEmpties = replicate n []

transposeHelper : (x : Vect n el) -> (xsTrans : Vect n (Vect k el)) -> Vect n (Vect (S k) el) 
transposeHelper [] [] = []
transposeHelper (x :: xs) (y :: ys) = (x :: y) :: transposeHelper xs ys

transposeMatrix : {n : _} -> Vect m (Vect n el) -> Vect n (Vect m el)
transposeMatrix [] = createEmpties
transposeMatrix (x :: xs) = let xsTrans = transposeMatrix xs in
                                zipWith (::) x xsTrans
