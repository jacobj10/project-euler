cartProd xs ys = [(x,y) | x <- xs, y <- ys]

divModMult :: Integer -> Integer -> Integer -> Integer -> Integer
divModMult x divX modX multX = (mod (div x divX) modX) * multX
isPalindrome :: Integer  -> Bool
isPalindrome x =  (divModMult x 1 10 100)+(divModMult x 10 10 10)
      +(divModMult x 100 10 1) == (div x 1000)

foldPalindrome m curr |
  isPalindrome curr &&
    curr > m = curr |
    otherwise = m


main :: IO ()
main = do
  let d1 = [100..999]
  let d2 = [100..999]
  let cp = cartProd d1 d2
  let m0 = foldl (\m curr -> (foldPalindrome m ((fst curr) * (snd curr)))) 0 cp
  print m0
