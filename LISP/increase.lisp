(defun increase(l1)
           (cond
             ((null l1) l1)
             (T (cons (+ 1 (car l1))(increase (cdr l1)))))) 

(print (increase '(1 2 3)))