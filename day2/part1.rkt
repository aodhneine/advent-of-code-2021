#lang racket/base

(provide compute)

;; Computes the problem.
(define (compute instructions)
  (let ([result (foldl (lambda (current accumulator)
                  (let ([instruction (car current)]
                        [value (cdr current)])
                    (cond
                      [(eq? instruction 'forward) (cons (+ (car accumulator) value) (cdr accumulator))]
                      [(eq? instruction 'up) (cons (car accumulator) (- (cdr accumulator) value))]
                      [(eq? instruction 'down) (cons (car accumulator) (+ (cdr accumulator) value))])))
                  (cons 0 0) ; distance, depth
                  instructions)])
    (* (car result) (cdr result))))
