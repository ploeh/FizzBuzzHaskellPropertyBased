module FizzBuzz where

fizzBuzz :: Integral a => a -> String
fizzBuzz i = if i `mod` 15 == 0 then "FizzBuzz" else "2112"