{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import FizzBuzz
import Test.Framework
import Test.Framework.Providers.QuickCheck2
import Test.QuickCheck

main :: IO ()
main =
  defaultMain
  [
    testProperty "Divisible by both 3 and 5" $ \ (seed :: Int) ->
      let i = seed * 3 * 5
          actual = fizzBuzz i
      in "FizzBuzz" === actual
  ]