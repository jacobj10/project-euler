import Data.HashMap.Strict
import Data.Maybe
import Debug.Trace

grid = 20

hashKey x y = (100 * x + y)

getResult x y memo |
  (x > grid) || (y > grid) = 0 |
  otherwise = fromJust (memo!? (hashKey x y))

traverseGrid :: Int -> Int -> HashMap Int Int -> HashMap Int Int
traverseGrid x y memo |
  isJust (memo!?(hashKey x y)) = memo |
  x == (grid + 1) = memo |
  y == (grid + 1) = memo |
  ((x == grid) && (y==grid)) = (insert (hashKey x y) 1 memo) |
  otherwise = do
    let result = (traverseGrid (x + 1) y (traverseGrid x (y + 1) memo))
    let resultR = getResult (x + 1) y result
    let resultD = getResult x (y+1) result
    insert (hashKey x y) (resultR + resultD) result

main :: IO ()
main = do
  print ((traverseGrid 0 0 Data.HashMap.Strict.empty)!?(hashKey 0 0))

