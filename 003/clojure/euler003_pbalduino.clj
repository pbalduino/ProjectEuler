(ns euler003-pbalduino)

; Problem 3 - Largest prime factor
;
; The prime factors of 13195 are 5, 7, 13 and 29.
; What is the largest prime factor of the number 600851475143?
;
; Source: https://projecteuler.net/problem=3

(let [target 600851475143
      r      (int (Math/sqrt target))]
  (last
    (loop [fs []
           nums (range 2 (inc r))]
      (let [f (first nums)]
        (if (empty? nums)
          fs
          (recur (conj fs f)
                 (filter #(and (not= 0 (mod % f))
                               (= 0 (mod target %)))
                         nums)))))))