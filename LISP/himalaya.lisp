(defun belong(l1)
	(cond
		((or (eq l1 'a )(eq l1 'b)(eq l1 'c)) t)
		
	)
)

(defun likes(l1 l2)
	(cond
		((and(eq l1 'a)(or(equal l2 "snow")(equal l2 "rain"))) t)
		((and(eq l1 'b)(not(equal l2 "rain"))) t)
        
		
	)
)


(defun mountain(l1)
	(cond
		((not (likes l1 "rain")) t)
		
	)
)

(defun skeir(l1)
	(cond
		( (likes l1 "snow") t)
		
	)
)


(defun belong1(l1)
	(cond
		((and (belong l1)(mountain l1)(skeir l1)) l1)
		
	)
)


(print (belong1 'a))


