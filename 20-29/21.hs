import qualified Data.Set as S
import Data.List

sumDivisorsFor n = do
 let  ami = foldl (\acc curr -> (acc + curr)) 0 (filter (\a -> (mod n a) == 0) [1..n-1])
 ((max ami n), (min ami n))

sumsUpTo n = map sumDivisorsFor [1..n]

total = 10000

isAmicable :: [(Int, Int)] -> (Int, Int) -> Bool
isAmicable sums n |
  (snd n)>= total = False |
  (snd (sums!!(snd n))) == (fst n) = True |
  otherwise = False

main :: IO ()
main = do
  let sums = sumsUpTo total
  let nonDuplicates = S.toList(S.fromList(sums))
  print(foldl (\acc curr -> ((fst curr) + (snd curr) + acc)) 0 (sums \\ nonDuplicates))
