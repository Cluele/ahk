; Forked from
; https://stackoverflow.com/questions/40435980
#NoEnv ; recommended for performance and compatibility with future autohotkey releases.
#UseHook
#InstallKeybdHook
#SingleInstance force

Menu, Tray, Icon, shell32.dll, 134

SendMode Input

;; note: must use tidle prefix to fire hotkey once it is pressed
;; not until the hotkey is released
~F15::
    ;; must use downtemp to emulate hyper key, you cannot use down in this case 
    ;; according to http://bit.ly/2fLyHHI, downtemp is as same as down except for ctrl/alt/shift/win keys
    ;; in those cases, downtemp tells subsequent sends that the key is not permanently down, and may be 
    ;; released whenever a keystroke calls for it.
    ;; for example, Send {Ctrl Downtemp} followed later by Send {Left} would produce a normal {Left}
    ;; keystroke, not a Ctrl{Left} keystroke
;;  Send {Ctrl DownTemp}{Shift DownTemp}{Alt DownTemp}{LWin DownTemp}
    KeyWait, F15
;;  Send {Ctrl Up}{Shift Up}{Alt Up}{LWin Up}
    if (A_PriorKey = "F15") {
        Send {F13}
    }
return

;; Navigation
~F15 & b:: Send {Blind}{Left}    ; capslock + B     : ←
~F15 & f:: Send {Blind}{Right}   ; capslock + F     : →
~F15 & p:: Send {Blind}{Up}      ; capslock + P     : ↑
~F15 & n:: Send {Blind}{Down}    ; capslock + N     : ↓
~F15 & a:: Send {Blind}{Home}    ; capslock + A     : Home
~F15 & e:: Send {Blind}{End}     ; capslock + E     : End
~F15 & ,:: Send {Blind}^{Home}   ; capslock + ,     : Ctrl-Home
~F15 & .:: Send {Blind}^{End}    ; capslock + .     : Ctrl-End
~F15 & d:: Send {Del}            ; capslock + D     : Delete
~F15 & h:: Send {BS}             ; capslock + H     : Backspace
~F15 & m:: Send {Enter}          ; capslock + M     : Enter

;; Function
~F15 & q:: Send !{F4}            ; capslock + Q     : Alt-F4
~F15 & Enter:: Send {F2}         ; capslock + Enter : F2
~F15 & Tab:: Send {F5}           ; capslock + Tab   : F5

;; Hotkeys
~F15 & c:: Send ^{c}             ; capslock + C     : Ctrl-C (Copy)
~F15 & v:: Send ^{v}             ; capslock + V     : Ctrl-V (Paste)
~F15 & s:: Send ^{s}             ; capslock + S     : Ctrl-S (Save)
~F15 & w:: Send ^{w}             ; capslock + W     : Ctrl-W (Close)
~F15 & l:: Send ^{l}             ; capslock + L     : Ctrl-L (Clear Console)
~F15 & t:: Send ^{t}             ; capslock + T     : Ctrl-T (New Tab)

;; Mouse
~F15 & Space:: Click                        ; クリック
~F15 & Numpad9:: MouseMove,  50, -50, 2, R  ; 右上
~F15 & Numpad8:: MouseMove,   0, -50, 2, R  ; 上
~F15 & Numpad7:: MouseMove, -50, -50, 2, R  ; 左上
~F15 & Numpad6:: MouseMove,  50,   0, 2, R  ; 右
~F15 & Numpad5:: Click                      ; クリック
~F15 & Numpad4:: MouseMove, -50,   0, 2, R  ; 左
~F15 & Numpad3:: MouseMove,  50,  50, 2, R  ; 右下
~F15 & Numpad2:: MouseMove,   0,  50, 2, R  ; 下
~F15 & Numpad1:: MouseMove, -50,  50, 2, R  ; 左下
~F15 & Numpad0:: MouseMove, 200, 200, 2     ; アクティブウィンドウ
~F15 & NumpadAdd::                          ; スクリーン中央
  HalfW := A_ScreenWidth // 2
  HalfH := A_ScreenHeight // 2
  DllCall("SetCursorPos", int, HalfW, int, HalfH)
