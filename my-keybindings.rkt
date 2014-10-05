#lang s-exp framework/keybinding-lang

(define (rebind key command)
  (keybinding
   key
   (lambda (ed evt)
     (send (send ed get-keymap) call-function
           command ed evt #t))))

(rebind "c:d" "shift-focus")