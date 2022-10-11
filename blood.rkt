;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname blood) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;
;; ***************************************************
;; Julien Liang (21006564)
;; CS 135 Fall 2022
;; Assignment 02, Problem 4
;; ***************************************************
;;

;; Note: the tests verify that under every possible condition the functions work properly -> tests for a) and b) are essentially identical

;;
;; Problem a)
;;

;; (can-donate-to/cond? donor-type recipient-type)
;; consumes blood type of donor and recipient and returns whether tranfusion is acceptable

;; Examples:
(check-expect (can-donate-to/cond? 'O- 'AB+) true)
(check-expect (can-donate-to/cond? 'AB+ 'A-) false)
(check-expect (can-donate-to/cond? 'O+ 'A-) false)

;; can-donate-to/cond?: Str Str -> Bool

(define (can-donate-to/cond? donor-type recipient-type)
(cond
  [(symbol=? 'O- donor-type) true]
  [(symbol=? 'AB+ recipient-type) true]
  [(symbol=? donor-type recipient-type) true]
  [(symbol=? 'O+ donor-type) (cond
                               [(symbol=? 'A+ recipient-type) true]
                               [(symbol=? 'B+ recipient-type) true]
                               [else false])]
  [(symbol=? 'A- donor-type) (cond
                               [(symbol=? 'A+ recipient-type) true]
                               [(symbol=? 'AB- recipient-type) true]
                               [else false])]
  [(symbol=? 'B- donor-type) (cond
                               [(symbol=? 'B+ recipient-type) true]
                               [(symbol=? 'AB- recipient-type) true]
                               [else false])]
  [else false]
  ))

;; Tests: 
(check-expect (can-donate-to/cond? 'O- 'O-) true)
(check-expect (can-donate-to/cond? 'O- 'O+) true)
(check-expect (can-donate-to/cond? 'O- 'A-) true)
(check-expect (can-donate-to/cond? 'O- 'A+) true)
(check-expect (can-donate-to/cond? 'O- 'B-) true)
(check-expect (can-donate-to/cond? 'O- 'B+) true)
(check-expect (can-donate-to/cond? 'O- 'AB-) true)
(check-expect (can-donate-to/cond? 'O- 'AB+) true)

(check-expect (can-donate-to/cond? 'O+ 'O-) false)
(check-expect (can-donate-to/cond? 'O+ 'O+) true)
(check-expect (can-donate-to/cond? 'O+ 'A-) false)
(check-expect (can-donate-to/cond? 'O+ 'A+) true)
(check-expect (can-donate-to/cond? 'O+ 'B-) false)
(check-expect (can-donate-to/cond? 'O+ 'B+) true)
(check-expect (can-donate-to/cond? 'O+ 'AB-) false)
(check-expect (can-donate-to/cond? 'O+ 'AB+) true)

(check-expect (can-donate-to/cond? 'A- 'O-) false)
(check-expect (can-donate-to/cond? 'A- 'O+) false)
(check-expect (can-donate-to/cond? 'A- 'A-) true)
(check-expect (can-donate-to/cond? 'A- 'A+) true)
(check-expect (can-donate-to/cond? 'A- 'B-) false)
(check-expect (can-donate-to/cond? 'A- 'B+) false)
(check-expect (can-donate-to/cond? 'A- 'AB-) true)
(check-expect (can-donate-to/cond? 'A- 'AB+) true)

(check-expect (can-donate-to/cond? 'A+ 'O-) false)
(check-expect (can-donate-to/cond? 'A+ 'O+) false)
(check-expect (can-donate-to/cond? 'A+ 'A-) false)
(check-expect (can-donate-to/cond? 'A+ 'A+) true)
(check-expect (can-donate-to/cond? 'A+ 'B-) false)
(check-expect (can-donate-to/cond? 'A+ 'B+) false)
(check-expect (can-donate-to/cond? 'A+ 'AB-) false)
(check-expect (can-donate-to/cond? 'A+ 'AB+) true)

(check-expect (can-donate-to/cond? 'B- 'O-) false)
(check-expect (can-donate-to/cond? 'B- 'O+) false)
(check-expect (can-donate-to/cond? 'B- 'A-) false)
(check-expect (can-donate-to/cond? 'B- 'A+) false)
(check-expect (can-donate-to/cond? 'B- 'B-) true)
(check-expect (can-donate-to/cond? 'B- 'B+) true)
(check-expect (can-donate-to/cond? 'B- 'AB-) true)
(check-expect (can-donate-to/cond? 'B- 'AB+) true)

(check-expect (can-donate-to/cond? 'B+ 'O-) false)
(check-expect (can-donate-to/cond? 'B+ 'O+) false)
(check-expect (can-donate-to/cond? 'B+ 'A-) false)
(check-expect (can-donate-to/cond? 'B+ 'A+) false)
(check-expect (can-donate-to/cond? 'B+ 'B-) false)
(check-expect (can-donate-to/cond? 'B+ 'B+) true)
(check-expect (can-donate-to/cond? 'B+ 'AB-) false)
(check-expect (can-donate-to/cond? 'B+ 'AB+) true)

(check-expect (can-donate-to/cond? 'AB- 'O-) false)
(check-expect (can-donate-to/cond? 'AB- 'O+) false)
(check-expect (can-donate-to/cond? 'AB- 'A-) false)
(check-expect (can-donate-to/cond? 'AB- 'A+) false)
(check-expect (can-donate-to/cond? 'AB- 'B-) false) 
(check-expect (can-donate-to/cond? 'AB- 'B+) false) 
(check-expect (can-donate-to/cond? 'AB- 'AB-) true)
(check-expect (can-donate-to/cond? 'AB- 'AB+) true)

(check-expect (can-donate-to/cond? 'AB+ 'O-) false)
(check-expect (can-donate-to/cond? 'AB+ 'O+) false)
(check-expect (can-donate-to/cond? 'AB+ 'A-) false)
(check-expect (can-donate-to/cond? 'AB+ 'A+) false)
(check-expect (can-donate-to/cond? 'AB+ 'B-) false)
(check-expect (can-donate-to/cond? 'AB+ 'B+) false) 
(check-expect (can-donate-to/cond? 'AB+ 'AB-) false)
(check-expect (can-donate-to/cond? 'AB+ 'AB+) true)

;;
;; Problem b)
;;

;; (can-donate-to/bool? donor-type recipient-type)
;; consumes blood type of donor and recipient and returns whether tranfusion is acceptable

;; Examples:
(check-expect (can-donate-to/bool? 'O- 'AB+) true)
(check-expect (can-donate-to/bool? 'AB+ 'A-) false)
(check-expect (can-donate-to/bool? 'O+ 'A-) false)


;; can-donate-to/bool?: Str Str -> Bool

(define (can-donate-to/bool? donor-type recipient-type)
  (or
  (symbol=? donor-type 'O-) 
  (symbol=? recipient-type 'AB+)
  (symbol=? donor-type recipient-type)
  (and (symbol=? donor-type 'O+) (or (symbol=? recipient-type 'A+) (symbol=? recipient-type 'B+)))
  (and (symbol=? donor-type 'A-) (or (symbol=? recipient-type 'A+) (symbol=? recipient-type 'AB-)))
  (and (symbol=? donor-type 'B-) (or (symbol=? recipient-type 'B+) (symbol=? recipient-type 'AB-)))
  ))

;; Tests:
(check-expect (can-donate-to/bool? 'O- 'O-) true)
(check-expect (can-donate-to/bool? 'O- 'O+) true)
(check-expect (can-donate-to/bool? 'O- 'A-) true)
(check-expect (can-donate-to/bool? 'O- 'A+) true)
(check-expect (can-donate-to/bool? 'O- 'B-) true)
(check-expect (can-donate-to/bool? 'O- 'B+) true)
(check-expect (can-donate-to/bool? 'O- 'AB-) true)
(check-expect (can-donate-to/bool? 'O- 'AB+) true)

(check-expect (can-donate-to/bool? 'O+ 'O-) false)
(check-expect (can-donate-to/bool? 'O+ 'O+) true)
(check-expect (can-donate-to/bool? 'O+ 'A-) false)
(check-expect (can-donate-to/bool? 'O+ 'A+) true)
(check-expect (can-donate-to/bool? 'O+ 'B-) false)
(check-expect (can-donate-to/bool? 'O+ 'B+) true)
(check-expect (can-donate-to/bool? 'O+ 'AB-) false)
(check-expect (can-donate-to/bool? 'O+ 'AB+) true)

(check-expect (can-donate-to/bool? 'A- 'O-) false)
(check-expect (can-donate-to/bool? 'A- 'O+) false)
(check-expect (can-donate-to/bool? 'A- 'A-) true)
(check-expect (can-donate-to/bool? 'A- 'A+) true)
(check-expect (can-donate-to/bool? 'A- 'B-) false)
(check-expect (can-donate-to/bool? 'A- 'B+) false)
(check-expect (can-donate-to/bool? 'A- 'AB-) true)
(check-expect (can-donate-to/bool? 'A- 'AB+) true)

(check-expect (can-donate-to/bool? 'A+ 'O-) false)
(check-expect (can-donate-to/bool? 'A+ 'O+) false)
(check-expect (can-donate-to/bool? 'A+ 'A-) false)
(check-expect (can-donate-to/bool? 'A+ 'A+) true)
(check-expect (can-donate-to/bool? 'A+ 'B-) false)
(check-expect (can-donate-to/bool? 'A+ 'B+) false)
(check-expect (can-donate-to/bool? 'A+ 'AB-) false)
(check-expect (can-donate-to/bool? 'A+ 'AB+) true)

(check-expect (can-donate-to/bool? 'B- 'O-) false)
(check-expect (can-donate-to/bool? 'B- 'O+) false)
(check-expect (can-donate-to/bool? 'B- 'A-) false)
(check-expect (can-donate-to/bool? 'B- 'A+) false)
(check-expect (can-donate-to/bool? 'B- 'B-) true)
(check-expect (can-donate-to/bool? 'B- 'B+) true)
(check-expect (can-donate-to/bool? 'B- 'AB-) true)
(check-expect (can-donate-to/bool? 'B- 'AB+) true)

(check-expect (can-donate-to/bool? 'B+ 'O-) false)
(check-expect (can-donate-to/bool? 'B+ 'O+) false)
(check-expect (can-donate-to/bool? 'B+ 'A-) false)
(check-expect (can-donate-to/bool? 'B+ 'A+) false)
(check-expect (can-donate-to/bool? 'B+ 'B-) false)
(check-expect (can-donate-to/bool? 'B+ 'B+) true)
(check-expect (can-donate-to/bool? 'B+ 'AB-) false)
(check-expect (can-donate-to/bool? 'B+ 'AB+) true)

(check-expect (can-donate-to/bool? 'AB- 'O) false)
(check-expect (can-donate-to/bool? 'AB- 'O+) false)
(check-expect (can-donate-to/bool? 'AB- 'A-) false)
(check-expect (can-donate-to/bool? 'AB- 'A+) false)
(check-expect (can-donate-to/bool? 'AB- 'B-) false) 
(check-expect (can-donate-to/bool? 'AB- 'B+) false) 
(check-expect (can-donate-to/bool? 'AB- 'AB-) true)
(check-expect (can-donate-to/bool? 'AB- 'AB+) true)

(check-expect (can-donate-to/bool? 'AB+ 'O-) false)
(check-expect (can-donate-to/bool? 'AB+ 'O+) false)
(check-expect (can-donate-to/bool? 'AB+ 'A-) false)
(check-expect (can-donate-to/bool? 'AB+ 'A+) false)
(check-expect (can-donate-to/bool? 'AB+ 'B-) false)
(check-expect (can-donate-to/bool? 'AB+ 'B+) false) 
(check-expect (can-donate-to/bool? 'AB+ 'AB-) false)
(check-expect (can-donate-to/bool? 'AB+ 'AB+) true)


