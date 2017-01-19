(defun appen(l1 l2)
           (cond
             ((null l1) l2)
             (T (cons (car l1)(appen (cdr l1) l2))))) 



(print (appen '(1 2 3) '(4 5 6)))