#lang racket

; Problem 1 - Multiples of 3 and 5
;
; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
; Find the sum of all the multiples of 3 or 5 below 1000.
;
; Source: https://projecteuler.net/problem=1

(foldl + 0 (filter (lambda (num)
                     (or (= 0 (remainder num 3))
                         (= 0 (remainder num 5))))
         (range 1000)))