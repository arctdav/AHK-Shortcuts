;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

MsgBox, Minimize Current Window [CapsLock]`rCapsLock [Shift CapsLock]`rGoogle Search highlighted text [CapsLock g]`rMultiple Clipboard X (from 1 to 0); Copy [Ctrl X]; Paste [CapsLock X]`rShow Text Stored in Each Clipboard on Notepad [CapsLock c]

;;;;;;;;;;;;;;;;;;;;;;;;;;;; CapsLock ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Minimize Current Window [CapsLock]
Capslock::WinMinimize,A

; CapsLock [Shift CapsLock]
+Capslock::Capslock

; Disable Ctrl Shift Shortcut
;^+::
;return

; Google Search highlighted text [Ctrl g]
CapsLock & g::
{
 Send, ^c
 Sleep 50
 Run, http://www.google.com/search?q=%clipboard%
 Return
}


;;;;;;;;;;;;;;;;;;;;; Multiple Clipboard ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Multiple Clipboard X (from 1 to 0)
; Copy [Ctrl X] 
; Paste [Ctrl Shift X]
^1::
ClipBoard_1 := GetFromClipboard()
return

CapsLock & 1::
SendInput {Raw}%ClipBoard_1%
return

^2::
ClipBoard_2 := GetFromClipboard()
return

CapsLock & 2::
SendInput {Raw}%ClipBoard_2%
return

^3::
ClipBoard_3 := GetFromClipboard()
return

CapsLock & 3::
SendInput {Raw}%ClipBoard_3%
return

^4::
ClipBoard_4 := GetFromClipboard()
return

CapsLock & 4::
SendInput {Raw}%ClipBoard_4%
return

^5::
ClipBoard_5 := GetFromClipboard()
return

CapsLock & 5::
SendInput {Raw}%ClipBoard_5%
return

^6::
ClipBoard_6 := GetFromClipboard()
return

CapsLock & 6::
SendInput {Raw}%ClipBoard_6%
return

^7::
ClipBoard_7 := GetFromClipboard()
return

CapsLock & 7::
SendInput {Raw}%ClipBoard_7%
return

^8::
ClipBoard_8 := GetFromClipboard()
return

CapsLock & 8::
SendInput {Raw}%ClipBoard_8%
return

^9::
ClipBoard_9 := GetFromClipboard()
return

CapsLock & 9::
SendInput {Raw}%ClipBoard_9%
return

^0::
ClipBoard_0 := GetFromClipboard()
return

CapsLock & 0::
SendInput {Raw}%ClipBoard_0%
return

; Show Text Stored in Each Clipboard on Notepad [Ctrl Shift c]

CapsLock & c::
{
  Run, Notepad
  Sleep, 1500
  SendInput, {Text}1: %ClipBoard_1%`r
  SendInput, {Text}2: %ClipBoard_2%`r
  SendInput, {Text}3: %ClipBoard_3%`r
  SendInput, {Text}4: %ClipBoard_4%`r
  SendInput, {Text}5: %ClipBoard_5%`r
  SendInput, {Text}6: %ClipBoard_6%`r
  SendInput, {Text}7: %ClipBoard_7%`r
  SendInput, {Text}8: %ClipBoard_8%`r
  SendInput, {Text}9: %ClipBoard_9%`r
  SendInput, {Text}0: %ClipBoard_0%`r
  return
}


;;;;;;;;;;;;;;;;;;;;;;;; Helper Function ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Multiple Clipboard
GetFromClipboard()
{ 
  ClipSaved := ClipboardAll ;Save the clipboard
  Clipboard = ;Empty the clipboard
  SendInput, ^c
  ClipWait, 2
  if ErrorLevel
  {
    MsgBox % "Failed attempt to copy text to clipboard."
    return
  }
  NewClipboard := Trim(Clipboard)
  StringReplace, NewClipboard, NewClipBoard, `r`n, `n, All
  Clipboard := ClipSaved ;Restore the clipboard
  ClipSaved = ;Free the memory in case the clipboard was very large.
  return NewClipboard
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;