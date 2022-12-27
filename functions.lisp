
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
