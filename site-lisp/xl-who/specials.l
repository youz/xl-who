;;; -*- mode: lisp; package:xl-who; -*-
;;; $Header: /usr/local/cvsrep/cl-who/specials.lisp,v 1.4 2008/03/27 23:17:55 edi Exp $

;;; Copyright (c) 2003-2008, Dr. Edmund Weitz. All rights reserved.

;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:

;;;   * Redistributions of source code must retain the above copyright
;;;     notice, this list of conditions and the following disclaimer.

;;;   * Redistributions in binary form must reproduce the above
;;;     copyright notice, this list of conditions and the following
;;;     disclaimer in the documentation and/or other materials
;;;     provided with the distribution.

;;; THIS SOFTWARE IS PROVIDED BY THE AUTHOR 'AS IS' AND ANY EXPRESSED
;;; OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;;; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
;;; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
;;; GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
;;; WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;; NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

(provide "xl-who/specials")

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "xl-who/package"))

(in-package :xl-who)

(defvar *prologue*
  "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">"
  "This is the first line that'll be printed if the :PROLOGUE keyword
argument is T")

(defparameter *escape-char-p*
  #'(lambda (char)
      (or (find char "<>&'\"")
          (> (char-code char) 127)))
  "Used by ESCAPE-STRING to test whether a character should be escaped.")

(defparameter *indent* nil
  "Whether to insert line breaks and indent. Also controls amount of
indentation dynamically.")

(defvar *html-mode* :xml
  ":SGML for \(SGML-)HTML, :XML \(default) for XHTML.")

(defvar *downcase-tokens-p* t
  "If NIL, a keyword symbol representing a tag or attribute name will
not be automatically converted to lowercase.  This is useful when one
needs to output case sensitive XML.")

(defparameter *attribute-quote-char* #\'
  "Quote character for attributes.")

(defparameter *empty-tag-end* " />"
  "End of an empty tag.  Default is XML style.")

(defparameter *html-empty-tags*
  '(:area
    :atop
    :audioscope
    :base
    :basefont
    :br
    :choose
    :col
    :frame
    :hr
    :img
    :input
    :isindex
    :keygen
    :left
    :limittext
    :link
    :meta
    :nextid
    :of
    :over
    :param
    :range   
    :right
    :spacer
    :spot
    :tab
    :wbr)
  "The list of HTML tags that should be output as empty tags.
See *HTML-EMPTY-TAG-AWARE-P*.")

(defvar *html-empty-tag-aware-p* t
  "Set this to NIL to if you want to use CL-WHO as a strict XML
generator.  Otherwise, CL-WHO will only write empty tags listed
in *HTML-EMPTY-TAGS* as <tag/> \(XHTML mode) or <tag> \(SGML
mode).  For all other tags, it will always generate
<tag></tag>.")

(defconstant +newline+ "\n"
  "Used for indentation.")

(defconstant +spaces+ (format nil "~V@{ ~}" 2000 t)
  "Used for indentation.")

