
dT = map (\n -> (div ((n*n) + n) 2)) [2..]

dP = map (\n -> (div ((3*n*n) - n) 2)) [2..]

dH = map (\n -> ((2*n*n) - n)) [2..]

upTo xs n |
  (head xs) >= n = xs |
  otherwise = (upTo (tail xs) n)

processStream (t: ts) (p : ps) (h : hs) |
  t == p && p == h = t |
  otherwise = do
    processStream (upTo ts (head hs)) (upTo ps (head hs)) (hs)

main :: IO ()
main = do
  print(processStream dT dP (upTo dH 40756))

