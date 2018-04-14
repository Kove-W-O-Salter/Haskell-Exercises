data Tree = Leaf | Node Int Tree Tree deriving Show


{-==========================+
 | Get the value of a tree. |
 +==========================-}
treeValue :: Tree -> Int

treeValue
  (Leaf)
    = 0

treeValue
  (Node value _ _)
    = value


{-================================+
 | Get the left branch of a Tree. |
 +================================-}
treeLeftBranch :: Tree -> Tree

treeLeftBranch
  (Leaf)
    = Leaf

treeLeftBranch
  (Node _ leftBranch _)
    = leftBranch


{-=================================+
 | Get the right branch of a Tree. |
 +=================================-}
treeRightBranch :: Tree -> Tree

treeRightBranch
  (Leaf)
    = Leaf

treeRightBranch
  (Node _ _ rightBranch)
    = rightBranch


{-==================================+
 | Get a list containing a Tree's   |
 | value and the values of all it's |
 | sub-Tree's.                      |
 +==================================-}
treeVals :: Tree -> [Int]

treeVals
  (Leaf) = []

treeVals
  (Node val leTree riTree)
    = [val] ++ subTreeVals

    where
      subTreeVals :: [Int]
      subTreeVals
        = (treeVals leTree) ++ (treeVals riTree)


{-==========================================+
 | Check if the a list meets the predicate  |
 | f which checks whether 2 elements are in |
 | the correct order.                       |
 +==========================================-}
checkSorted :: (Ord a) => (a -> a -> Bool) -> [a] -> Bool

checkSorted
  _ (x:[]) = True

checkSorted
  f (x:xs)
    = let
        nextElem
          = head xs
      in
        (x `f` nextElem) &&
        (checkSorted f xs)


{-================================+
 | Get the sum of a Tree's datas. |
 +================================-}
treeValSum :: Tree -> Int
treeValSum
  = sum . treeVals


{-====================================+
 | Checks if a tree is sorted biggest |
 | to smallest (reverse chronology).  |
 +====================================-}
checkTreeSorted :: Tree -> Bool
checkTreeSorted
  tree
    = checkSorted (>) (treeVals tree)
