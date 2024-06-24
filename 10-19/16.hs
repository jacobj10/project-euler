import Data.HashMap.Strict
import Data.Maybe
import Debug.Trace

sumDigits n total |
  n == 0 = total |
  otherwise = do
    sumDigits (div n 10) (total + (mod n 10))

main :: IO ()
main = do
  print (sumDigits (2^1000) 0)

