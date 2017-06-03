(defun derivative (f x)
	(cond
		((atom f) (return-from derivative (deriveatom f x)))
		((eq '+ (car f)) (derivesum f x))
		((eq '* (car f)) (deriveproduct f x))
		((eq 'sin (car f)) (derivesin f x))
		((eq 'exp (car f)) (deriveexp f x))
		((eq 'log (car f))(derivelog f x))
		((eq '/ (car f)) (derivediv f x))
		(T (print "Derivation out of scope."))
	)
)

(defun deriveatom (f x)
	(cond
		((numberp f) (return-from deriveatom 0))
		((eq f 'x) (return-from deriveatom 1))
		(T (return-from deriveatom 0))
	)
)

(defun derivesum (f x)
	(return-from derivesum (+ (derivative (cadr f) x) (derivative (caddr f) x)))
)

(defun deriveproduct (f x)
	(cond
		((and (numberp (cadr f)) (numberp (caddr f))) (return-from deriveproduct 0))
		(T (return-from deriveproduct 
				(list 
					(list (derivative (cadr f) x) '* (caddr f)) 
					'+ 
					(list (derivative (caddr f) x) '* (cadr f))
				)
			)
		)
	)	
)

(defun derivesin (f x)
	(cond
		((numberp (cadr f)) (return-from derivesin 0))
		
		(T (return-from derivesin 
				(list
			 		'cos 
			 		(cond
			 				((eq '+ (car (cadr f))) (list (cadr (cadr f)) '+ (caddr (cadr f))))
			 				((eq '* (car (cadr f))) (list (cadr (cadr f)) '* (caddr (cadr f))))
			 				(T (list (cdr f)))	
			 		) 
			 		'* 
			 		(derivative (cadr f) x)
			 	)
			)
		)
	)
)



(defun deriveexp (f x)
	(cond
		((numberp (cadr f)) (return-from deriveexp (exp (cadr f))))
		
		(T (return-from deriveexp
				(list
			 		'exp 
			 		(cond
			 				((eq '+ (car (cadr f))) (list (cadr (cadr f)) '+ (caddr (cadr f))))
			 				((eq '* (car (cadr f))) (list (cadr (cadr f)) '* (caddr (cadr f))))
			 				(T (list (cdr f)))	
			 		) 
			 		'* 
			 		(derivative (cadr f) x)
			 	)
			)
		)
	)
)

(defun derivelog (f x)
	(cond
		((numberp (cadr f)) (return-from derivelog (/ (cadr f))))
		
		(T (return-from derivelog
				(list
			 		1 '/
			 		(cond
			 				((eq '+ (car (cadr f))) (list (cadr (cadr f)) '+ (caddr (cadr f))))
			 				((eq '* (car (cadr f))) (list (cadr (cadr f)) '* (caddr (cadr f))))
			 				(T (list (cdr f)))	
			 		) 
			 		'* 
			 		(derivative (cadr f) x)
			 	)
			)
		)
	)
)


(defun derivediv (f x)
	(cond
		((and (numberp (cadr f)) (numberp (caddr f))) (return-from derivediv 0))
		(T (return-from derivediv
				(list 
					
					(list (derivative (cadr f) x) '* (caddr f)) 
					'- 
					(list (derivative (caddr f) x) '* (cadr f))

					'/
					(list (caddr f) '* (caddr f))
				)
				
				
			)
		)
	)	
)

(write (derivative '(log (+ x 0)) 'x))
