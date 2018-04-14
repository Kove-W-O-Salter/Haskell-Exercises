data Tree = Leaf | Node Int Tree Tree

treeSum :: Tree -> Int
treeSum Leaf = 0
treeSum (Node value leTree riTree)
  = value + subValue
  where
    subValue = (treeSum leTree) + (treeSum riTree)

tree'Value :: Tree -> Int
tree'Value Leaf = 0
tree'Value (Node value _ _)
  = value

tree'Left :: Tree -> Tree
tree'Left Leaf = Leaf
tree'Left (Node _ left _)
  = left

tree'Right :: Tree -> Tree
tree'Right Leaf = Leaf
tree'Right (Node _ _ right)
  = right

checkTreeSorted :: Tree -> Int -> Int -> Bool
checkTreeSorted Leaf  _ _ = True
checkTreeSorted (Node value leTree riTree) minValue maxValue
  = let riSorted      = checkTreeSorted riTree minValue value
        leSorted      = checkTreeSorted leTree minValue value
        subTreeSorted = riSorted && leSorted
    in value < maxValue && value > minValue && subTreeSorted

checkTreeSorted' :: Tree -> Bool
checkTreeSorted' (Node value leTree riTree)
  = sorted (< value) leTree &&
    sorted (> value) riTree
  where
    sorted :: (Int -> Bool) -> Tree -> Bool
    sorted _ Leaf = True
    sorted f (Node value leTree riTree)
      = (f value) && leSorted && riSorted
      where
        leSorted = sorted f leTree
        riSorted = sorted f riTree

myIsSortedTree :: Tree -> Bool
myIsSortedTree Leaf = True
myIsSortedTree (Node x leftSubtree rightSubtree)
  = ( x >  fst (leftHelper leftSubtree)   ) &&
    ( x <= fst (rightHelper rightSubtree) ) &&
    ( snd (leftHelper leftSubtree)        ) &&
    ( snd (rightHelper rightSubtree)      )
where
  leftHelper  ( Leaf           ) = ( minBound, True         )
  leftHelper  ( Node y lST rST ) = ( y, (myIsSortedTree lST ) &&
                                    ( myIsSortedTree rST)   )

  rightHelper ( Leaf           ) = ( maxBound, True         )
  rightHelper ( Node y lST rST ) = ( y, (myIsSortedTree lST ) &&
                                    ( myIsSortedTree rST)   ) 
