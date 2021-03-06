module FizzBuzz where

fizzBuzz :: (Integral a, Show a) => a -> String
fizzBuzz i | i `mod` 15 == 0 = "FizzBuzz"
fizzBuzz i | i `mod`  3 == 0 = "Fizz"
fizzBuzz i | i `mod`  5 == 0 = "Buzz"
fizzBuzz i = show i