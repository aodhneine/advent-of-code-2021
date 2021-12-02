#lang racket/base

(require (prefix-in day2p2: "day2/part2.rkt") (prefix-in day2p1: "day2/part1.rkt") (prefix-in day2: "day2/parse.rkt"))

(day2p1:compute (day2:parse "day2/part1-input.txt"))
(day2p2:compute (day2:parse "day2/part1-input.txt"))
