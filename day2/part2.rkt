#lang racket/base

(require
  (only-in racket/list first second third))

(provide compute)

;; Computes the problem.
(define (compute instructions)
  (let ([result (foldl (lambda (current accumulator)
                  (let ([instruction (car current)]
                        [value (cdr current)]
                        [distance (first accumulator)]
                        [depth (second accumulator)]
                        [aim (third accumulator)])
                    (cond
                      [(eq? instruction 'forward) (list (+ distance value) (+ depth (* aim value)) aim)]
                      [(eq? instruction 'up) (list distance depth (- aim value))]
                      [(eq? instruction 'down) (list distance depth (+ aim value))])))
                  (list 0 0 0) ; distance, depth, aim
                  instructions)])
    (* (first result) (second result))))
