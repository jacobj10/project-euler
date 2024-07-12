kSentinel = -(10 ^ 50)

hundredDigit n |
  (n < 100) = 0 |
  (n < 200) = (length "onehundredand") |
  (n < 300) = (length "twohundredand") |
  (n < 400) = (length "threehundredand") |
  (n < 500) = (length "fourhundredand") |
  (n < 600) = (length "fivehundredand") |
  (n < 700) = (length "sixhundredand") |
  (n < 800) = (length "sevenhundredand") |
  (n < 900) = (length "eighthundredand") |
  (n < 1000) = (length "ninehundredand") |
  otherwise = kSentinel

tenDigit n |
  (mod n 100) == 0 = -3 |
  (mod n 100) < 10 = 0 |
  (mod n 100) == 10 = (length "ten") |
  (mod n 100) == 11 = (length "eleven") |
  (mod n 100) == 12 = (length "twelve") |
  (mod n 100) == 13 = (length "thirteen") |
  (mod n 100) == 14 = (length "fourteen") |
  (mod n 100) == 15 = (length "fifteen") |
  (mod n 100) == 16 = (length "sixteen") |
  (mod n 100) == 17 = (length "seventeen") |
  (mod n 100) == 18 = (length "eighteen") |
  (mod n 100) == 19 = (length "nineteen") |
  (mod n 100) < 30 = (length "twenty") |
  (mod n 100) < 40 = (length "thirty") |
  (mod n 100) < 50 = (length "forty") |
  (mod n 100) < 60 = (length "fifty") |
  (mod n 100) < 70 = (length "sixty") |
  (mod n 100) < 80 = (length "seventy") |
  (mod n 100) < 90 = (length "eighty") |
  (mod n 100) < 100 = (length "ninety") |
  otherwise = kSentinel

oneDigit n |
  (((mod n 100) > 10) && ((mod n 100) < 20)) = 0 |
  (mod n 10) == 0 = 0 |
  (mod n 10) == 1 = (length "one") |
  (mod n 10) == 2 =  (length "two") |
  (mod n 10) == 3 = (length "three") |
  (mod n 10) == 4 = (length "four") |
  (mod n 10) == 5 = (length "five") |
  (mod n 10) == 6 = (length "six") |
  (mod n 10) == 7 = (length "seven") |
  (mod n 10) == 8 = (length "eight") |
  (mod n 10) == 9 = (length "nine") |
  otherwise = kSentinel


letterCount n =
  (hundredDigit n) + (tenDigit n) + (oneDigit n)

main :: IO ()
main = do
  print ((foldl (\acc curr -> (acc + letterCount curr)) 0 [1..999]) + (length "onethousand"))
  
