lengthList :: [a] -> Int
lengthList [] = 0
lengthList (x:xs)
  = 1 + (lengthList xs)

filterList :: (a -> Bool) -> [a] -> [a]
filterList _ [] = []
filterList predicate (x:xs) 
  | predicate x = x : (filterList predicate xs)
  | otherwise   = filterList predicate xs
