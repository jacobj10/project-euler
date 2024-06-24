fac :: Integral a => a -> a
fac 0 = 1
fac n = n * (fac (n-1))

numDigits n ct |
  n == 0 = ct |
  otherwise = numDigits (div n 10) (ct + 1)

returnVal ct n |
  ct == n = n |
  otherwise = 0

factCt :: [Int] -> Int -> Int -> Int -> Int
factCt facs n originalN ct |
  n == 0 = returnVal ct originalN |
  otherwise = factCt facs (div n 10) originalN (ct + (facs!!(mod n 10)))

digitCounts facs n ct |
  (last facs) * (numDigits n 0) < n = ct |
  otherwise = digitCounts facs (n+1) (ct + (factCt facs n n 0))
    
  


main :: IO ()
main = do
  let factorials = map fac [0..9]
  print factorials
  print(digitCounts factorials 10 0)
