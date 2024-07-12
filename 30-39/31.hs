values = [200, 100, 50, 20, 10, 5, 2, 1]

kMax = 200

waysToSplit total denoms |
  total > kMax = 0 |
  total == kMax = 1 |
  (length denoms) == 0 = 0 |
  otherwise = do
    (waysToSplit (total + (head denoms)) denoms) 
      + (waysToSplit total (tail denoms)) 

  

main :: IO ()
main = do
  print (waysToSplit 0 values)
