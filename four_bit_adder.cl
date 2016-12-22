;; returns a list of bits: '(sum carry)
(defun half-adder (a b)
  (list (logxor a b) (logand a b)))

;; returns a list of bits: '(sum, carry)
(defun full-adder (a b c-in)
  (let*
    ((h1 (half-adder c-in a))
    (h2 (half-adder (first h1) b)))
    (list (first h2) (logior (second h1) (second h2)))))