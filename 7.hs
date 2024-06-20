isPrime :: [Integer] -> Integer -> Bool
isPrime primes n =
 do
  foldl (\acc curr -> (acc && (mod n curr > 0))) True primes


nthPrime :: Integer -> Int -> [Integer] -> [Integer]
nthPrime n limit primes |
  length primes == limit = primes |
  isPrime primes n = nthPrime (n+2) limit (primes++[n]) |
  otherwise = nthPrime (n+2) limit  primes


-- A integner N is prime iff it does not divide any known prime less than N
main :: IO ()
main = do
  let primes = nthPrime 3 10001   [2]
  print (last primes)
