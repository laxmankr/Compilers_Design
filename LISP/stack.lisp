(setq var '())


(defun push(l1)
 (setf var (cons l1 var))
 )

 (defun pop()
 	(cond
     ((null var) nil)
 	(t (setf var (cdr var)))
 	
 	) 
 	)



(print (pop))
(print(push 5))
(print(push 6))

