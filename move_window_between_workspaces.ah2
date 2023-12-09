;you should first Run this, then Read this
;Ctrl + F: jump to #useful stuff

;#SETUP START
#SingleInstance force
ListLines 0
SendMode "Input"
SetWorkingDir A_ScriptDir
KeyHistory 0
#WinActivateForce

ProcessSetPriority "H"

SetWinDelay -1
SetControlDelay -1


;START of gui stuff
myGui:=Gui()
myGui.SetFont("s12", "Segoe UI")
explanation:="
(
Ctrl + Super + Shift + Left/Right: move window to left/right and follow it
)"
Explanation_Edit:=myGui.add("Edit", "-vscroll -E0x200", explanation) ; https://www.autohotkey.com/boards/viewtopic.php?t=3956#p21359
;deselect edit text BY moving caret to start
Postmessage 0xB1,0,0,, "ahk_id " Explanation_Edit.hwnd
myGui.title:="VD.ahk examples WinTitle"
myGui.show()
;END of gui stuff

;include the library
#Include %A_LineFile%\..\VD.ahk\VD.ah2
; or
; #Include %A_LineFile%\..\_VD.ahk
; ...{startup code}
; VD.init()

; VD.ahk : calls `VD.init()` on #Include
; _VD.ahk : `VD.init()` when you want, like after a GUI has rendered, for startup performance reasons

;you should WinHide invisible programs that have a window.
try WinHide "Malwarebytes Tray Application"
;#SETUP END

VD.createUntil(3) ;create until we have at least 3 VD

return

; wrapping / cycle back to first desktop when at the last
; ^#left::VD.goToRelativeDesktopNum(-1)
; ^#right::VD.goToRelativeDesktopNum(+1)

; move window to left and follow it
^#+left::VD.goToDesktopNum(VD.MoveWindowToRelativeDesktopNum("A", -1))
; move window to right and follow it
^#+right::VD.goToDesktopNum(VD.MoveWindowToRelativeDesktopNum("A", 1))

f3::Exitapp
