{-# LANGUAGE ScopedTypeVariables #-}
module Main where

import Data.Maybe
import Data.List
import Text.Read
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
    ,
    testProperty "At least one number in 3 consecutive values" $ \ (i :: Int) ->
      let range = [i..i+2]
          actual = fizzBuzz <$> range
      in counterexample
          (show range ++ "->" ++ show actual) $
          any (\x -> isJust (readMaybe x :: Maybe Int)) actual
    ,
    testProperty "At least one Fizz in 3 consecutive values" $ \ (i :: Int) ->
      let range = [i..i+2]
          actual = fizzBuzz <$> range
      in counterexample
          (show range ++ "->" ++ show actual) $
          any ("Fizz" `isPrefixOf`) actual
    ,
    testProperty "Only one Buzz in 5 consecutive values" $ \ (i :: Int) ->
      let range = [i..i+4]
          actual = fizzBuzz <$> range
      in counterexample
          (show range ++ "->" ++ show actual) $
          1 == length (filter ("Buzz" `isSuffixOf`) actual)
    ,
    testProperty "At least one literal Buzz in 10 values" $ \ (i :: Int) ->
      let range = [i..i+9]
          actual = fizzBuzz <$> range
      in counterexample
          (show range ++ "->" ++ show actual) $
          elem "Buzz" actual
    ,
    testProperty "Numbers round-trip" $ \ (i :: Int) ->
      let range = [i..i+2]

          actual = fizzBuzz <$> range

          numbers = catMaybes $ readMaybe <$> actual
      in counterexample
          (show range ++ "->" ++ show actual) $
          all (`elem` range) numbers
  ]