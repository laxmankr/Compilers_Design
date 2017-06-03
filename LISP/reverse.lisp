(defun appen(l1 l2)
           (cond
             ((null l1) l2)
             (T (cons (car l1)(appen (cdr l1) l2))))) 

(defun rev(l)
           (cond
             ((null l) '())
             ( (appen (rev (cdr l)) (list (car l)))))) 


(print (rev '(1 2 3 4)))