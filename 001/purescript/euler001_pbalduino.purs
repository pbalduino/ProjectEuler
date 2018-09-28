{-
Problem 1 - Multiples of 3 and 5

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
Find the sum of all the multiples of 3 or 5 below 1000.

Source: http://projecteuler.net/problem=1
-}

module Main where

import Prelude
import Control.Monad.Eff.Console (log)
import Data.Maybe (Maybe (..))
import Data.Array (range, uncons, (:))

double :: Int -> Int
double n = n * 2

sum :: Int -> Int -> Int
sum a b = a + b

filter :: (Int -> Boolean) -> Array Int -> Array Int
filter f arr = case uncons arr of
  Just {head: x, tail: xs} -> if (f x) then x :(filter f xs) else (filter f xs)
  Nothing -> []

reduce :: (Int -> Int -> Int) -> Array Int -> Int -> Int
reduce f arr acc = case uncons arr of
  Just {head: x, tail: xs} -> reduce f xs $ (f x acc)
  Nothing -> acc

multiple_of :: Int -> Int -> Boolean
multiple_of m n = ((mod n m) == 0)

multiple_of_3 :: Int -> Boolean
multiple_of_3 = (multiple_of 3)

multiple_of_5 :: Int -> Boolean
multiple_of_5 = (multiple_of 5)

multiples :: Int -> Boolean
multiples n = (multiple_of_3 n) || (multiple_of_5 n)

numbers :: Array Int
numbers = (range 0 999)

main = log $ show $ reduce sum (filter multiples numbers) 0
