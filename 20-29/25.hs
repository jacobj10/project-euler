fibs = (0, 0) : (1, 1) : zipWith ((\l r -> (((fst r) + 1), ((snd l) + (snd r))))) fibs (tail fibs)

main :: IO ()
main = 
  print ((fst (last (takeWhile (\f -> ((snd f) < 10^999)) fibs)))+1)
