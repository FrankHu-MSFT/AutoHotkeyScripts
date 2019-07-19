#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



;***********Select All******************* 
Numpad0::^a
return


; https://www.autohotkey.com/docs/KeyList.htm#numpad
; For all AHK numpad items

;***********Get Git Author's Name*******************
Numpad1::
Send, {CTRL DOWN}a{CTRL UP}
Sleep, 100
Send, {CTRL DOWN}c{CTRL UP}
Sleep, 100
var:=Clipboard
RegExMatch(var,"Open(.*)opened",m)	; saves only the text from 'Text name' to the end of the 'Port' line
m := RegExReplace(m,"Open","")
m := RegExReplace(m,"opened","")
m := RegExReplace(m,"\x20{2,}","")
m := RegExReplace(m,"\t","")
Clipboard := m
WinGetPos,,,Xmax,Ymax,A ; get active window size
Xcenter := Xmax/4        ; Calculate quarter of window, so we move to the quarter left of the screen to click. nothing there on git
Ycenter := Ymax/2
ControlClick, x%Xcenter% y%Ycenter%, A
return

;***********Tag Github Issue with CXP, Triaged, and Product-Question*******************
Numpad2::
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {SPACE}
Sleep, 1000
Send, cxp
Sleep, 150
Send, {ENTER}
Sleep, 150
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, triaged
Sleep, 150
Send, {ENTER}
Sleep, 150
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, product-question
Sleep, 150
Send, {ENTER}
Sleep, 150
return

;***********Load Git Template Reply With Author Name******************* 
Numpad3::
Send,@
Sleep, 150
Send,{CTRL DOWN}v{CTRL UP}
Sleep, 150
clipboard:= "Thanks for your feedback! We will investigate and update as appropriate."
Send,{CTRL DOWN}v{CTRL UP}
return

;***********Run Notepad++******************* 
Numpad4::
Run, notepad++.exe  ; Run Notepad when you press CTRL+N.
return  

;***********Tag Github Issue with CXP, Triaged, and Product-Feedback*******************
Numpad5::
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {SPACE}
Sleep, 1000
Send, cxp
Sleep, 150
Send, {ENTER}
Sleep, 150
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, triaged
Sleep, 150
Send, {ENTER}
Sleep, 150
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, product-feedback
Sleep, 150
Send, {ENTER}
Sleep, 150
return

;***********Decode URL & Wrap on Parameters******************* 
Numpad6:: ;Decode URL and Wrap on parameters
gosub Store_Clipboard_Copy_Selected_Text
clipboard:=URiDecode(clipboard) 
StringReplace,clipboard,clipboard,?,`r`n`t?,All ;Line break and tab indent <strong>parse URL parameters</strong>.
StringReplace,clipboard,clipboard,&,`r`n`t`t&,All ;Line break and double tab indent
Gosub Paste_and_Restore_Stored_Clipboard
return



;Numpad7 available


;***********Tag Github Issue with CXP, Triaged, and doc-enhancement*******************
Numpad8::
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {TAB}
Sleep, 20
Send, {SPACE}
Sleep, 1000
Send, cxp
Sleep, 150
Send, {ENTER}
Sleep, 150
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, triaged
Sleep, 150
Send, {ENTER}
Sleep, 150
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, {BACKSPACE}
Send, doc-enhancement
Sleep, 150
Send, {ENTER}
Sleep, 150
return

;***********Templated Response for MSDN******************* 
Numpad9::
Send, I'm following up on this, please remember to mark one of the responses as answer if your question has been answered. If not please let us know if there are anymore questions. Thanks!
return

;Numpad+ available
;Numpad_clear available
;Numpad_backspace available
;Numpad_calc available
;numpad_enter available




;***********Encode URL******************* 
NumpadMult:: ; numpad * encodes highlighted text
gosub Store_Clipboard_Copy_Selected_Text ;backup original clipboard
Clipboard:=UriEncode(clipboard)  ;convert to URL encoded
Gosub Paste_and_Restore_Stored_Clipboard ;restore clipboard
return
 
;***********Decode URL******************* 
NumpadSub:: ;Alt+d will Decode highlighted text
gosub Store_Clipboard_Copy_Selected_Text
Clipboard:=URiDecode(clipboard) ;Decode URL
Gosub Paste_and_Restore_Stored_Clipboard ;restore clipboard
return


;*******Store Clipboard- save for restoring, and copy selected text to clipboard****************
Store_Clipboard_Copy_Selected_Text:
Store:=ClipboardAll  ;Store full version of Clipboard
  clipboard = ; Empty the clipboard
  SendInput, ^c ;changd from Send  11/23
  ClipWait, 1
    If ErrorLevel ;Added errorLevel checking
      {
        MsgBox, No text was sent to clipboard
        Return
      }
return
 
;**********************restore clipboard*********************************
Paste_and_Restore_Stored_Clipboard:  ;put back original content
SendEvent , ^v
Clipboard:=Store
return
 
 
;***********https://autohotkey.com/board/topic/17367-url-encoding-and-decoding-of-special-characters/******************* 
uriDecode(str) {
    Loop
 If RegExMatch(str, "i)(?<=%)[\da-f]{1,2}", hex)
    StringReplace, str, str, `%%hex%, % Chr("0x" . hex), All
    Else Break
 Return, str
}
 
UriEncode(Uri, RE="[0-9A-Za-z]"){
    VarSetCapacity(Var,StrPut(Uri,"UTF-8"),0),StrPut(Uri,&Var,"UTF-8")
    While Code:=NumGet(Var,A_Index-1,"UChar")
    Res.=(Chr:=Chr(Code))~=RE?Chr:Format("%{:02X}",Code)
    Return,Res  
}