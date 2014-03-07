(ns euler04
  (:import [java.lang Math])
  (:require [clojure.string :as str]))


; Problem 4 - Largest palindrome product
;
; A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
; Find the largest palindrome made from the product of two 3-digit numbers.
;
; Source: https://projecteuler.net/problem=4

(defn count-digits [number]
  (int (inc (Math/log10 number))))

(defn peel-2 [number]
  )

(defn peel
  "Peel a string like a banana, removing first and last character"
  [str]
  (butlast (rest str)))

(defn palindrome?
  "Returns true or false if name is a palindrome.
   This recursive approach is slightly faster than compare with its reverse."
  [name]
  (let [f (first name)
        l (last name)]
    (if (or (empty? name) (not= f l))
      (= f l)
      (recur (peel name)))))

(defn largest-palindrome
  " A palindromic number reads the same both ways. The largest palindrome made
  from the product of two 2-digit numbers is 9009 = 91 99.
  Find the largest palindrome made from the product of two 3-digit numbers."
  []
  (loop [a 999
         big 0]
    (let [r (loop [b a
                   p2 (palindrome? (str (* a b)))]
              (if
                (and
                  (> b 99)
                  (not p2))
                (recur (dec b)
                       (palindrome? (str (* a (dec b)))))
                (* a b)))]
      (if
        (and
          (> a 99))
        (recur (dec a)
          (if (> r big)
            r
            big))
        big))))

(defn gen-pal? [a b]
  (let [p (str (* a b))]
    (palindrome? p)))

(defn weq [s]
  (let [a (first s)
        b (some #(when (gen-pal? a %) %) s)]

    (if (nil? b)
      (recur (rest s))
      [a b])))

(defn hop []
  (weq (range 999 99 -1)))

(defn euler04-3 []
  (last (sort
    (for [x (range 100 1000)
          y (range x 1000)
          :let [s (str (* x y))]
          :when (= s (str/reverse s))]
      s))))

(largest-palindrome)
