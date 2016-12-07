(defvar *initial_data*
	(list
		(list "jsmith" "x" 1001 1000 (list
			"Joe Smith" "Room 1007" "(234)555-8917" "(234)555-0077" "jsmith@rosettacode.org"
		) "/home/jsmith" "/bin/bash")
		(list "jdoe" "x" 1002 1000 (list
			"Jane Doe"
			"Room 1004"
			"(234)555-8914"
			"(234)555-0044"
			"jdoe@rosettacode.org"
		) "/home/jdoe" "/bin/bash"))
	)

(defvar *insert*
	(list "xyz" "x" 1003 1000 (list
		"X Yz" "Room 1003" "(234)555-8913" "(234)555-0033" "xyz@rosettacode.org")
	"/home/xyz" "/bin/bash"))

(defun format_for_write (record)
	(reduce (lambda (a b)
		(print b)
		(typecase b
			(list "")
			(integer (concatenate 'string a ":" (write-to-string b)))
			(t (concatenate 'string a ":" b)))
		) record :initial-value ""))
			

(defun main ()
	(with-open-file (stream "./passwd" 
					:direction :output 
					:if-exists :supersede
					:if-does-not-exist :create)
		(loop for x in *initial_data* do (format_for_write x))
	))

(main)