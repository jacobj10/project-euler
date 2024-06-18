increment n
  | (mod n 3 == 0) = n
  | (mod n 5 == 0) = n
  | otherwise = 0

multipleSum :: Integer -> Integer -> Integer
multipleSum 0 total =
 do
  total

multipleSum n total  =
 do
  multipleSum (n-1) (total+(increment n))

main :: IO ()
main = do
  print (multipleSum 999 0)
