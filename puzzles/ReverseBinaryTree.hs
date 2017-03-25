-- tree type
data Tree a = Null | Leaf a | Node a (Tree a) (Tree a)
                deriving (Show, Eq)

reverseTree :: Tree a -> Tree a
reverseTree (Leaf x) = Leaf x
reverseTree Null = Null
reverseTree (Node v l r) = Node v (reverseTree r) (reverseTree l)

-- example

exampleInput :: Tree Integer
exampleInput = Node 6 (Node 3 (Leaf 7) (Leaf 3)) (Node 4 (Leaf 8) (Leaf 1))

exampleOutput :: Tree Integer
exampleOutput = Node 6 (Node 4 (Leaf 1) (Leaf 8)) (Node 3 (Leaf 3) (Leaf 7))

test :: Bool
test = reverseTree exampleInput == exampleOutput

test2 :: Bool
test2 = exampleInput == (reverseTree . reverseTree) exampleInput
