increment n
  | (mod n 2 == 0) = n
  | otherwise = 0

fibIt :: Integer -> Integer -> Integer -> Integer
fibIt i1 i2 total |
 i1 > 4000000 =  total |
 otherwise =
 do
  fibIt i2 (i1 + i2) (total+(increment i1))

main :: IO ()
main = do
  print (fibIt 1 2 0)
