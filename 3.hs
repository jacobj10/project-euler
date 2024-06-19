isPrime :: [Integer] -> Integer -> Bool
isPrime primes n =
 do
  foldl (\acc curr -> (acc && (mod n curr > 0))) True primes

newLimit limit n |
  mod limit n == 0 = div limit n |
  otherwise = limit

-- If we find a prime factor N, divide the limit by N to reduce
-- the time complexity.
primesFrom :: Integer -> Integer -> [Integer] -> [Integer]
primesFrom n limit primes |
  n > limit = primes |
  isPrime primes n = primesFrom (n+2) (newLimit limit n) (primes++[n]) |
  otherwise = primesFrom (n+2) (newLimit limit n) primes

highestDivider :: Int -> [Integer] -> Integer -> Integer
highestDivider idx primes n |
  primes!!idx == n = n |
  mod n (primes!!idx) == 0 = highestDivider idx primes (div n (primes!!idx)) |
  otherwise = highestDivider (idx + 1) primes n

main :: IO ()
main = do
  let primes = primesFrom 3 600851475143  [2]
  print (highestDivider 0 primes 600851475143)
