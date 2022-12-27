
(print (car (list 1 2 3 4 5)))
(print (cdr (list 1 2 3 4 5)))
(print (car (cdr (list 1 2 3 4 5))))

(print (cons 1 (list 2 3 4 5)))
(print (cons 1 2))
(print (cons (list 1 2) (list 3 4)))
(print (eq (cons 1 2) (cons (list 1) (list 2))))

(print (atom 1))
(print (atom (list 1)))
(print (atom (car (list 1 2))))
(print (atom (car (list 1))))
(print (atom (cdr (list 1 2))))
(print (atom (cdr (list 1))))

(print (null (list 1 2 3)))
(print (null (list)))
(print (null (car (list 1 2 3))))

(cond ((null (list 1 2 3)) (print "null"))
      ((atom (list 1 2 3)) (print "atom"))
      (t (print "none")))

(defun myfun (x)
  (cond ((null x) (print "null"))
        ((atom x) (print "atom"))
        (t (print "none"))))

(myfun (list 1 2 3))
(myfun (list))
(myfun (car (list 1 2 3)))

(print ((LAMBDA (X)  
    (COND
        ((ATOM X) "atom") 
        ((NULL X) "null")
        ((QUOTE T) (FF (CAR X)))
        ((QUOTE NIL) (FF (CDR X)))
    )
)1))

(print ((LAMBDA (X) (CAR (CDR (CDR X)))) (LIST "ICH" "BIN" "WACH")))
