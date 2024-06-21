import Debug.Trace
import qualified Data.Set as Set
import qualified Data.List as List


isPrime :: [Integer] -> Integer -> Bool
isPrime primes n =
  foldl (\acc curr -> (acc && (mod n curr > 0))) True primes

primesFrom :: Integer -> Integer -> [Integer] -> [Integer]
primesFrom n limit primes |
  n > limit = primes |
  isPrime primes n = primesFrom (n+2) limit (primes++[n]) |
  otherwise = primesFrom (n+2) limit primes

primeFactorsFor :: [Integer] -> [Integer] -> Integer -> [Integer]
primeFactorsFor primes factors n |
  length primes == 0 = 
  do
    factors |
  n == 1 = 
  do
    factors |
  mod n (primes!!0) == 0 =
  do
    let idx = primes!!0
    (primeFactorsFor primes (factors++[idx]) (div n idx))|
  otherwise = 
  do
    (primeFactorsFor (tail primes) factors n)

listCount l n = 
  do
    foldl (\acc curr -> (if (curr == n) then acc else (acc +1))) l

lcmF :: [[Integer]] -> [Integer] -> [Integer]
lcmF factors seen|
  length factors == 0 = seen |
  otherwise = do
    let newFactors = (factors!!0) List.\\ seen
    traceShow (seen) (lcmF (tail factors) (seen++newFactors))
    
main :: IO ()
-- The LCM of the numbers (1..20) = (2..20). Each number has a unique
-- prime factorizations  (p1...pn).
--
-- The LCM will be the integer which contains the union of all prime factorizations,
-- treating duplicate prime factotrs as distinct values.
main = do
  let d1 = [2..20]
  let primesFrom20 = primesFrom 3 20 [2]
  let factors = map (primeFactorsFor primesFrom20 []) d1
  print (foldl (\acc curr -> acc*curr) 1 (lcmF factors []))
