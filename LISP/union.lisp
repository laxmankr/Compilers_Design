(defun rem_dup (L)
   (cond ((null L) nil)                         
         ((member (car L) (cdr L )) (rem_dup (cdr L)))
         (T (cons (car L) (rem_dup (cdr L))))))



(defun appen(l1 l2)
           (cond
             ((null l1) l2)
             (T (cons (car l1)(appen (cdr l1) l2))))) 


 (defun member (el l)
      (cond
       ((null l) nil)
       ((equal el (car l)) T)
       (T (member el (cdr l)))))



(defun union(l1 l2)
           (cond
             ((null l1) (rem_dup l2))
             ((member (car l1) (appen (cdr l1) l2)) (union (cdr l1) l2))
             (T (cons (car l1) (union (cdr l1) l2)))))


(defun inter(l1 l2)
           (cond
             ((null l1) nil)
             ((member (car l1) l2) (cons (car l1) (inter (cdr l1) l2)))
             (T (inter (cdr l1) l2))))

(defun inter1(l1 l2)

      (rem_dup (inter l1 l2))
  )

(defun diff(l1 l2)
           (cond
             ((null l1) nil)
             ((member (car l1) l2) (diff (cdr l1) l2))
             (T (cons (car l1) (diff (cdr l1) l2)))))

(defun xor(l1 l2)
         (diff (union l1 l2) (inter l1 l2))
  )

(print (diff '(1 2 3) '(1 1 2 5)))