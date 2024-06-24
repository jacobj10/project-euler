isFiveSum n total originalN |
  n == 0 = (total == originalN) |
  otherwise = do
    isFiveSum (div n 10) (total + (mod n 10)^5) originalN

numDigits n total |
  n == 0 = total |
  otherwise = (numDigits (div n 10) (total + 1))

sumFiveSums (x : xs) total |
  ((numDigits x 0) * (9^5)) < x = total |
  (isFiveSum x 0 x) = sumFiveSums xs (total + x) |
  otherwise = sumFiveSums xs total

main :: IO ()
main = do
  print (sumFiveSums [2..] 0)
