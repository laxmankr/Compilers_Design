(defun mylen (l)
  (cond 
 
    ((eq (car l) nil)0)
  	((eq (cdr l) nil) 1)

    (T (+ 1 (mylen (cdr l))))))

(print (mylen '(1 2 3 4)))