-- Consider (p1+p2...+pN)^2 - (p1^2+p2^2...+pN^2)
--          p1(p1+p2 +...pN) + p2(p1+p2...pN) - (p1^2+p2^2...+pN^2)
--      let tN = (p1+p2...+pN) = (pN * (pN + 1) / 2)
--      We then have:
--        p1(tN) + p2(tN) ... + pN(tN) - p1^2 - p2^2...-pN^2
--        p1^2 + p1(tN - p1) + p2^2 + p2(tN - p2)... pN^2 + pN(tN - pN) - p1^2 - p2^2 - ... pN^2
--      Which cancels out to:
--        p1(tN - p1) + p2(tN - p2)...pN(tN - pN)
--      Which allows us to solve this problem in O(N)
main :: IO ()
main = do
  let n = 100
  let tN = div (n*(n+1)) 2
  let series = [1..n]
  let difference = foldl (\acc curr -> acc+(curr*(tN-curr))) 0 series
  print difference
