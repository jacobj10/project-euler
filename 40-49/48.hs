
series = map (\acc -> (acc ^ acc)) [1..]

main :: IO ()
main = do
  let result = (foldl (\acc curr -> (acc+curr)) 0 (take 1000 series))
  print (mod result (10^10))
