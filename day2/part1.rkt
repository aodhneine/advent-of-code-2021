#lang racket/base

(require
  (only-in racket/list first second))

(provide compute)

(define (fold-instructions instructions)
  (foldl
    (lambda (current accumulator)
      (let ([instruction (car current)]
            [value (cdr current)]
            [distance (first accumulator)]
            [depth (second accumulator)])
        (case instruction
          ['forward (list (+ distance value) depth)]
          ['up (list distance (- depth value))]
          ['down (list distance (+ depth value))])))
    (list 0 0) ; distance, depth
    instructions))

;; Computes the problem.
(define (compute instructions)
  (let ([result (fold-instructions instructions)])
    (* (first result) (second result))))
