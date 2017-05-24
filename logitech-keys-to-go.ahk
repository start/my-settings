Browser_Back::Esc
Capslock::Ctrl 

Browser_Home::F1

; The Keys-To-Go keyboard has a task-switching
; hotkey in place of the F2 key. It works by
; signaling LAlt and then Tab.
;
; Unfortunately, it's not immediately obvious
; how to distinguish an emulated LAlt+Tab from
; a real one. The solution will likely involve
; determining the exact timing of the emulated
; chord.
;
; Until I've figured that out, LAlt+Tab will
; trigger F2 even when I'm pressing the chord
; myself.
LAlt & Tab::Send {F2}

AppsKey::F3
Launch_Mail::F4
Launch_Media::F5
Media_Prev::F6
Media_Play_Pause::F7

; This keyboard only has 11 hotkeys along the
; top. Of the 12 traditional function keys, I
; use F8 least frequently, so I'm moving it
; to the Browser_Search key (left of the arrow
; keys).
Browser_Search::F8

Media_Next::F9
Volume_Down::F10
Volume_Up::F11
PrintScreen::F12
