 (defun member (el l)
      (cond
       ((null l) '(Not a member of List))
       ((equal el (car l)) '(Member of List))
       ((member el (cdr l)))))

 (print (member 5 '(1 2 3 4)))