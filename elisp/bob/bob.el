;;; bob.el --- Bob exercise (exercism)

;;; Commentary:

;;; Code:

(defun bob--respond-to-silence (input)
  (string-empty-p (s-trim input)))

(defun bob--respond-to-yelling (input)
  (if (string-match-p "[[:alpha:]]" input)
      (s-uppercase? input)
    nil))

(setq bob--response-alist `(("Whatever." . (lambda (i) t))
                            ("Fine. Be that way!" . ,'bob--respond-to-silence)
                            ("Sure." . (lambda (i) (s-suffix? "?" i)))
                            ("Whoa, chill out!" . ,'bob--respond-to-yelling)))

(defun response-for (input)
  (dolist (resp-inp bob--response-alist response)
    (if (funcall (cdr resp-inp) input)
        (setq response (car resp-inp))
      nil)))

(provide 'bob)
;;; bob.el ends here
