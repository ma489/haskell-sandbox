{- Maybe monad example -}

{- Here's how Maybe is defined

instance Monad Maybe where
    return          =  Just
    (Just x) >>= f  =  f x
    Nothing  >>= f  =  Nothing

-}

-- Let's place a value, 3, in the context of the Maybe Monad, giving us a Maybe Int
-- (We'll use 'return' here, but we could have used the 'Just' constructor)
x :: Maybe Int
x = return 3

-- Now lets define a function that will take an Int, and turn that Int into a String, but maintain the Maybe context
f :: Int -> Maybe String
f a = return $ show a

-- Here we apply function f to the Int 'inside' x, using the bind (>>=) operator
-- Think of the bind operator (>>=) as taking the value from 'inside' the Monad and passing it to the function to its right
applyFtoX :: Maybe String
applyFtoX = x >>= f

-- We can build up an even longer chain
applyMultipleFunctionsToX :: Maybe Double
applyMultipleFunctionsToX = x >>= f >>= g >>= h

g :: String -> Maybe Int
g a = return $ (read a :: Int)

h :: Int -> Maybe Double
h a = return $ (fromIntegral a * 2.1)

-- or using Haskell's do-notation
applyMultipleFunctionsToXwithDo:: Maybe Double
applyMultipleFunctionsToXwithDo = do
  x' <- x
  x'' <- f x'
  x''' <- g x''
  x'''' <- h x'''
  return x'''' -- or we can just return h x''' instead
