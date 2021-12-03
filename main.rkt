#lang racket/base

(require
  (prefix-in day2/part2: "day2/part2.rkt")
  (prefix-in day2/part1: "day2/part1.rkt")
  (prefix-in day2: "day2/parse.rkt"))

(day2/part1:compute (day2:parse "day2/input.txt"))
(day2/part2:compute (day2:parse "day2/input.txt"))
