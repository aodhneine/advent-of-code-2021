#lang racket/base

(require
  (only-in racket/file file->lines)
  (only-in racket/string string-split))

(provide parse)

;; Returns command in a format ('command value), so i.e. "forward 5" is parsed
;; as ('forward 5).
(define (line->command line)
  (let* ([parts (string-split line)]
         [instruction (car parts)])
    (cons
      (cond
        [(equal? instruction "forward") 'forward]
        [(equal? instruction "up") 'up]
        [(equal? instruction "down") 'down])
      (string->number (cadr parts)))))

;; Returns file parsed into list of instructions.
(define (parse path)
  (map line->command (file->lines path #:mode 'text #:line-mode 'linefeed)))
