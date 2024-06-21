import Debug.Trace

factorial n |
  n == 1 = 1 |
  otherwise = do
    n * (factorial (n-1))
    

digitSum :: Integer -> Integer -> Integer
digitSum n total |
  n == 0 =  total |
  otherwise = do
    digitSum (div n 10) (total+(mod n 10))

main :: IO ()
main = do
  print (digitSum (factorial 100) 0)
  
