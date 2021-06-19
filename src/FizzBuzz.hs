module FizzBuzz where

fizzBuzz :: Integral a => a -> String
fizzBuzz i = if i `mod` 3 == 0 then "FizzBuzz" else "2112"