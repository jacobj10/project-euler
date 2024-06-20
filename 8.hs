import Debug.Trace
import qualified Data.List as List

cartProd xs ys = [(x,y) | x <- xs, y <- ys]

constant :: Integer
constant = (div (1000^2) 2)

satisfiesEquation b c =
  do 
    let result = (constant - (c^2) - (b * c))
    let divResult = div result (b+c)
    (c > b && b > divResult && divResult > 0) && (mod result (b+c) == 0) && ((divResult + b + c) == 1000)

main :: IO ()
main = do
  let cs = [1..997]
  let bs = [1..997]
  let bcs = cartProd cs bs
  let result = filter (\x -> (satisfiesEquation (snd x) (fst x))) bcs
  -- This gives B and C, A is trivial.
  print (result)
  
