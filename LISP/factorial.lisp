(defun FACT (N)

       (COND

       	   ((= N 0) 1)

       	   ((= N 1) 1)

           (T (* N (FACT(- N 1))))))

(print (FACT 12))