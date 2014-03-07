(ns euler001)

; Problem 1 - Multiples of 3 and 5
;
; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
; Find the sum of all the multiples of 3 or 5 below 1000.
;
; Source: https://projecteuler.net/problem=1

(defn by-n [n]
  (fn [x]
    (= 0 (mod x n))))

(def by-3 (by-n 3))
(def by-5 (by-n 5))

(defn multiples []
  (reduce +
          (filter #(or (by-3 %)
                       (by-5 %))
                  (range 1 1000))))

(multiples)