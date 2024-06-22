import Data.HashMap.Strict
import Data.Maybe

newN :: Int -> Int
newN n |
  mod n 2 == 0 = (div n 2) |
  otherwise = ((3 * n) + 1)

shouldUpdate new old =
  min old new

collatzFor :: Int -> HashMap Int Int -> (Int, HashMap Int Int)
collatzFor n memoMap |
  n == 1 = do
    (1, memoMap) |
  isJust (memoMap!?n) = do
    ((fromJust (memoMap!?n)), memoMap) |
  otherwise = do
    let tup = (collatzFor (newN n) memoMap)
    let new = (fst tup) + 1
    (new, (insertWith shouldUpdate n new (snd tup)))


-- collatzes :: Int [Int] ->  HashMap Int Int  -> [Int]
collatzes (x:xs) memoList result |
  x == 1000000 = result |
  otherwise = do
    let tup = collatzFor x memoList
    result ++ [(fst tup)] ++ (collatzes xs (snd tup) result)

maxEnum acc curr |
  (snd curr) > (snd acc) = curr |
  otherwise = acc

main :: IO ()
main = do
  let lens = (collatzes [1..] (Data.HashMap.Strict.empty) [])
  let enumLens = zip [1..] lens
  -- print enumLens
  print (Prelude.foldl maxEnum (0, 0) enumLens)

