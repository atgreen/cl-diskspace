;;;; cl-diskinfo.asd

(eval-when (:load-toplevel :execute)
  (asdf:operate 'asdf:load-op 'cffi-grovel)
  (asdf:operate 'asdf:load-op 'cffi))

(asdf:defsystem #:cl-diskspace
  :name "diskspace"
  :version "0.1"
  :description "Disk total/free/usable space information."
  :author "Muyinliu Xing <muyinliu@gmail.com>"
  :serial t
  :depends-on (#:cffi #:cffi-grovel)
  :components ((:module "src"
                :serial t
                :components ((:file "packages")
                             #+(or bsd freebsd linux)
                             (:module "unix"
                              :serial t
                              :components ((cffi-grovel:grovel-file "grovel-statvfs")
                                           (:file "cl-diskspace-statvfs")))))))
