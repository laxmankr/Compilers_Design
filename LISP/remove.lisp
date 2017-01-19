 (defun member (el l)
      (cond
       ((null l) ' nil)
       ((equal el (car l)) T)
       (T (member el (cdr l)))))

(defun rem_dup (L)
   (cond ((null L) nil)                         
         ((member (car L) (cdr L )) (rem_dup (cdr L)))
         (T (cons (car L) (rem_dup (cdr L))))))


(print (rem_dup '(2 1 3 4 5 5 6 7 8 8 9 10)))
