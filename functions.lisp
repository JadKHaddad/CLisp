(defun eq* (x y)
  (cond 
    ((atom x) (cond 
                ((atom y) (eq x y))
                (t nil)))
    ((eq* (car x) (car y)) (eq* (cdr x) (cdr y)))
    (t nil)))

(print (eq* '(a b c) '(a b c)))


(defun subst* (x y z)
  (cond 
    ((null z) nil)
    ((equal y z) x)
    ((atom z) z)
    (t (cons (subst* x y (car z)) (subst* x y (cdr z))))))

(print (subst* 'a 'b '(a b c (a b c) a b c)))


(defun append* (x y)
  (cond 
    ((null x) y)
    (t (cons (car x) (append* (cdr x) y)))))

(print (append* '(a b c) '(d e f)))


(defun member* (x y)
  (cond 
    ((null y) nil)
    ((equal x (car y)) t)
    (t (member* x (cdr y)))))

(print (member* 'a '(a b c)))


(defun pairlis* (x y a)
  (cond 
    ((null x) a)
    (t (cons (cons (car x) (car y)) (pairlis* (cdr x) (cdr y) a)))))

(print (pairlis* '(a b c) '(d e f) nil))


(defun assoc* (x y)
  (cond 
    ((null y) nil)
    ((equal x (caar y)) (car y))
    (t (assoc* x (cdr y)))))

(print (assoc* 'a '((a b) (c d) (e f))))


(defun sub2* (x y)
  (cond 
    ((null x) y)
    ((equal (car (car x)) y) (cdr (car x)))
    (t sub2* (cdr x) y)))

(print (sub2* '((a b) (c d) (e f)) 'a))


(defun sublis* (x y)
  (cond 
    ((atom y) (sub2* x y))
    (t (cons (sublis* x (car y)) (sublis* x (cdr y))))
    ))


(defun pn (x)
  (cond
    ((eq (car x) 1) (cons (cons (car x) 'EINS)(pn (cdr x))))
    ((eq (car x) 2) (cons (cons (car x) 'ZWEI)(pn (cdr x))))
    ((eq (car x) 3) (cons (cons (car x) 'DREI)(pn (cdr x))))
    (t nil)))

(print (pn (list 1 2 3 2)))

;; M-Expression
;; pn[x] =
;;   [ equal[car[x];1]->cons[cons[1;EINS];pn[cdr[x]]];
;;     equal[car[x];2]->cons[cons[2;ZWEI];pn[cdr[x]]];
;;     equal[car[x];3]->cons[cons[3;DREI];pn[cdr[x]]];
;;     T->NIL] ]

(defun numerate (x)
  (labels ((numerate_ (index y)
    (cond
      ((null y) nil)
      (t (cons (cons index (car y))(numerate_ (1+ index) (cdr y))))
    ))) 
  (numerate_ 1 x)))

(print (numerate (list 'a 'b 'c)))

;; M-Expression
;; numerate_ [x;y] =
;;   [ equal[y;NIL]->NIL;
;;     T->cons[cons[x;car[y]];numerate_[plus[1;x];cdr[y]]] ]

;; numerate[x] = numerate_[1;x]


(print (maplist #'(lambda (x) (cons 'NUM (car x))) (list 'a 'b 'c)))


;; TODO: Tabs!
(defun printlist (x)
  (cond
    ((null x) nil)
    ((atom (car x)) (print "(") (print  (car x)) (printlist (cdr x))  (print ")"))

    (t (printlist (car x)) (printlist (cdr x)))
    ))

(printlist (list "1" (list "2" "3") "4"))