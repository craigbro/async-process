(quicklisp:quickload "async-process")

(defpackage :async-process-test
  (:use :cl :uiop :async-process))

(in-package :async-process-test)

(let ((ap (create-process "hostname"))
      (hname (uiop:run-program "hostname" :output :string)))
  (cl:assert (equal (process-receive-output ap)
                    hname)))

(quit)