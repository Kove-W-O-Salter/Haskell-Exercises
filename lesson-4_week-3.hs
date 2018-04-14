import Data.Char

-- //Task 1
--succUpper :: String -> String
--succUpper = map (toUpper . succ)
-- \\Task 1

-- //Task 2
--succUpper' :: String -> String
--succUpper' str
--  = foldl (\accumulator x
--              -> ((succ . toUpper) x) : accumulator) "" (reverse str)
-- \\Task 2

-- //Task 3
--value = foldr (\acc elt -> elt:acc) "" "Reversing a string"
-- \\Task 3

-- //Task 4
--value = foldr (\elt acc -> elt:acc) "" "Reversing a string"
-- \\Task 4

-- //Task 5
--value = reverse (foldr (\elt acc -> elt:acc) "" "Reversing a string")
-- \\Task 5

-- //Task 6
succUpper :: String -> String
succUpper = map (toUpper . succ)
-- \\Task 6
