---
layout: post
title: "Getting Started with LISP"
date: 2022-02-10 22:51:24 +0000
permalink: /blog/2022/02/getting-started-with-lisp/
tags: ["programming languages", "#docs"]
---

<p></p><figure class="kg-card kg-image-card"><img src="https://asjadkhan.ghost.io/content/images/2022/02/image.png" class="kg-image" alt="" loading="lazy" width="640" height="211" srcset="https://asjadkhan.ghost.io/content/images/size/w600/2022/02/image.png 600w, https://asjadkhan.ghost.io/content/images/2022/02/image.png 640w"></figure><p>Developed by John McCarthy, MIT, in the late 1950s the original idea was to implement a language based on mathematical functions that McCarthy was using to model problem solving. A grad student implemented the first interpreter, and it was quickly adopted for AI programming:</p><p>- symbolic computing<br>- list processing<br>- recursion</p><p>Early Lisp was based almost entirely on recursive and so Lisp had no local variables nor iterative control structures (loops), and since Lisp was interpreted, there was no compiler for early Lisp. In part because this was early in the history of high level languages, and in part because of the desire to support AI. </p><p>We now look at some basic interesting problems, to get started with lisp:</p><p>Define a function (SumIfNot &lt;list1&gt; &lt;list2&gt;) which returns the sum of all elements in list2 that do not appear in list1. Both lists may be nested lists.</p><blockquote>Example: (SumIfNot ‘(1 8 (2)) ‘(1 (3 (5)) 7 9)) returns 24.</blockquote><pre><code class="language-lisp">;;----------------------------------------------------
;;flattens a nested list using recurisive startegy
;;car and cdr are used to recursively break down the list into smaller list
;;base condition for recursion is when its nil or has one element(checked by atom keyword)
;;when base condition is reached it backtracks and append statement is used to create one final list
(defun flatten_list(mylist)

	(cond ((null mylist) nil)
	
	((atom mylist) (list mylist))
	
	(t 
		(append (flatten_list (car mylist))

		(flatten_list (cdr mylist))

	) ) )
)

;;----------------------------------------------------
;;Function checks if an element is in a given list or not. 
;;return 0 if not and the element if its present
(defun checkelement (mylist1 element)


(if (equalp (find element (flatten_list mylist1)) nil)
0
element

);;end of if
)

;;----------------------------------------------------
;;Main Function that gets called.
;;calls checkelement inside
(defun SumIfNot(mylist1 mylist2)
	(cond ((null mylist2) 0)
		
		((atom mylist2) (checkelement mylist1 mylist2))
		
		(t (+ (SumIfNot mylist1 (car mylist2))
		
			(SumIfNot mylist1 (cdr mylist2)))
		)))


</code></pre><p></p><p>Check for prime numbers: </p><pre><code>
;;----------------------------------------------------
;;returns 0 in case the num is not prime and 1 otherwise
(defun IsPrime(num)
	
	(if (&lt;= num 1) 
		(setq result 0) 


(progn


(if (= num 2) 
		(setq result 1)

(progn
	(setq i 2)
	(
	loop while (&lt; i num)
	
	do 

	(if (= (mod num i) 0)
		(return 0))
	(setf i (+ 1 i))
	(return 1)
	)



);;end of inner progn
);;end of inner if

);;end of progn
);;end of if
	)

;;----------------------------------------------------
;;recursively iterates through the list by breaking it into sublists
;;car and cdr are used to recursively break down the list into smaller lists
;;base condition for recursion is when its nil or has one element(checked by atom keyword)
;;if one element is left in recurision, we check if its prime using IsPrime function
;;incase its prime we increment counter using the + operator

(defun OccurencesOfPrimes(mylist)

	(cond ((null mylist) 0)
		
		((atom mylist) (IsPrime mylist))
		
		(t (+ (OccurencesOfPrimes (car mylist))
		
			(OccurencesOfPrimes (cdr mylist)))

		)

		)

)

;;----------------------------------------------------
;;temporary/intermediate function used inside checkprimes
;if given number is not prime it returns nil else returns the number itself(to be added later to the result)
(defun IsPrime2(num)

(if (&lt;= num 1) 
		(setq result nil) 


(progn


(if (= num 2) 
		(setq result 1)

(progn

	(setq i 2)
	(
	loop while (&lt; i num)
	
	do 

	(if (= (mod num i) 0)
		 (return nil))
	(setf i (+ 1 i))
	(return num)
	)


);;end of inner progn
);;end of inner if

);;end of progn
);;end of if
	)

;;----------------------------------------------------
;;recursively breaks down the list and checks if the number is prime or not.
;;incase its prime it gets added to the final result
(defun checkprimes(mylist)

	(cond ((null mylist) nil)
	
	((atom mylist) (list (IsPrime2 mylist)))
	
	(t 
		(append (GetListOfPrimes (car mylist))

		(GetListOfPrimes (cdr mylist))

	) ) ))


;;----------------------------------------------------
;;calls checkprimes
(defun GetListOfPrimes(mylist)

	(remove-duplicates (remove nil (checkprimes mylist)))

)


</code></pre><p></p><p>If you found these examples interesting, here are a few more exercises for further practice:</p><p>Define a function (even &lt;list&gt;) which returns the subset (a list) of even numbers contained in a given numeric, possibly nested list. The result must maintain the order of the even numbers as they appeared in the original list.</p><blockquote><em>Example: (even ‘(1 2 (3 4) -4)) returns (2 4 -4).</em></blockquote><p>2. Define a function (OccurencesInTree &lt;n&gt; &lt;tree&gt;) which counts the number of occurrences of the value &lt;n&gt; in a numeric tree. Use a breadth first approach when traversing the tree.</p><blockquote><em>Example: (OccurencesInTree 3 ‘(((1)(2))(5)(3)((8)3)) returns 2.</em></blockquote>
