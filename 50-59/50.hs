import Data.List.Ordered (minus, union, unionAll)


import Data.Set (Set)

primes = 2 : 3 : minus [5,7..] (unionAll [[p*p, p*p+2*p..] | p <- tail primes])

main :: IO ()
main = do
  let primes = (takeWhile (< 1000000) (primes))
  let primeSet = Set.fromList(primes)
  print(primeSet)
