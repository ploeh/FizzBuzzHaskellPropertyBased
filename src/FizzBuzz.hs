module FizzBuzz where

fizzBuzz :: Integral a => a -> String
fizzBuzz i | i `mod` 5 == 0 = "FizzBuzz"
fizzBuzz i | i `mod` 3 == 0 = "Fizz"
fizzBuzz _ = "2112"