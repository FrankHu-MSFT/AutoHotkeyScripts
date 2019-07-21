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
RegExMatch(var,"Open(.*)opened",m)	; saves only the Open _____ opened text from the webpage
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
gosub label_cxp_and_triage
Send, product-question
Sleep, 500
Send, {TAB}
Sleep, 150
Send, {SPACE}
Sleep, 150
Send, {SHIFT DOWN}{TAB}{SHIFT UP}
Sleep, 150
WinGetPos,,,Xmax,Ymax,A ; get active window size
Xcenter := Xmax/4        ; Calculate quarter of window, so we move to the quarter left of the screen to click. nothing there on git
Ycenter := Ymax/2
ControlClick, x%Xcenter% y%Ycenter%, A
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
gosub label_cxp_and_triage
Send, product-feedback
Sleep, 500
Send, {TAB}
Sleep, 150
Send, {SPACE}
Sleep, 150
Send, {SHIFT DOWN}{TAB}{SHIFT UP}
Sleep, 150
WinGetPos,,,Xmax,Ymax,A ; get active window size
Xcenter := Xmax/4        ; Calculate quarter of window, so we move to the quarter left of the screen to click. nothing there on git
Ycenter := Ymax/2
ControlClick, x%Xcenter% y%Ycenter%, A
return   

;***********Decode URL & Wrap on Parameters******************* 
Numpad6:: ;Decode URL and Wrap on parameters
gosub Store_Clipboard_Copy_Selected_Text
clipboard:=URiDecode(clipboard) 
StringReplace,clipboard,clipboard,?,`r`n`t?,All ;Line break and tab indent <strong>parse URL parameters</strong>.
StringReplace,clipboard,clipboard,&,`r`n`t`t&,All ;Line break and double tab indent
Gosub Paste_and_Restore_Stored_Clipboard
return


;***********Templated Response for GitHub******************* 
Numpad7::
Send, Please let us know if there are anymore questions within the scope of this git issue. If not, I will be closing out this git issue by end of day today. Please reopen this git issue if you have anymore concerns. Thanks! 
return

;***********Tag Github Issue with CXP, Triaged, and doc-enhancement*******************
Numpad8::
gosub label_cxp_and_triage
Send, doc-enhancement
Sleep, 500
Send, {TAB}
Sleep, 150
Send, {SPACE}
Sleep, 150
Send, {SHIFT DOWN}{TAB}{SHIFT UP}
Sleep, 150
WinGetPos,,,Xmax,Ymax,A ; get active window size
Xcenter := Xmax/4        ; Calculate quarter of window, so we move to the quarter left of the screen to click. nothing there on git
Ycenter := Ymax/2
ControlClick, x%Xcenter% y%Ycenter%, A
return

;***********Templated Response for MSDN******************* 
Numpad9::
Send, I'm following up on this, please remember to mark one of the responses as answer if your question has been answered. If not please let us know if there are anymore questions. Thanks!
return

;Numpad+ available
;Numpad_clear available
;Numpad_backspace available
;Numpad_calc available

NumpadDiv::
gosub label_cxp_and_triage
Send, doc-issue
Sleep, 500
Send, {TAB}
Sleep, 150
Send, {SPACE}
Sleep, 150
Send, {SHIFT DOWN}{TAB}{SHIFT UP}
Sleep, 150
WinGetPos,,,Xmax,Ymax,A ; get active window size
Xcenter := Xmax/4        ; Calculate quarter of window, so we move to the quarter left of the screen to click. nothing there on git
Ycenter := Ymax/2
ControlClick, x%Xcenter% y%Ycenter%, A
return


 


;Using numpadenter as a tester



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







;************************************************* Below are functions for button press macros *********************************************







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

Store_Clipboard:
Store:=ClipboardAll  ;Store full version of Clipboard
clipboard = ; Empty the clipboard
return
 
;**********************restore clipboard*********************************
Paste_and_Restore_Stored_Clipboard:  ;put back original content
SendEvent , ^v
Clipboard:=Store
return
 
Restore_Stored_Clipboard:  ;put back original content
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

;************************************* Add CXP and Triaged labels *************************************
label_cxp_and_triage:
; check if there's an assignee first. 
gosub Store_Clipboard ;backup original clipboard
Send, {CTRL DOWN}a{CTRL UP}
Sleep, 20
Send, {CTRL DOWN}c{CTRL UP}
Sleep, 70
var:=Clipboard
RegExMatch(var,"Assignees No one",m)	; Finds regexmatch
if (m=""){
	Msgbox There is already an assignee or this was run on a page that wasn't a git issue.                  				         									                	The behavior is unpredictable on pages that aren't git issues. 										Please be careful next time.
	Exit ; terminate the program
}else{
	Send, {CTRL DOWN}r{CTRL UP}
	Sleep, 2000
	Send, {TAB}
	Sleep, 20 cxp
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




	; begin labeling
	Send, cxp
	Sleep, 500
	Send, {TAB}
	Sleep, 150
	Send, {SPACE}
	Sleep, 150
	Send, {SHIFT DOWN}{TAB}{SHIFT UP}
	Send, {BACKSPACE}
	Send, {BACKSPACE}
	Send, {BACKSPACE}


	Send, triaged
	Sleep, 500
	Send, {TAB}
	Sleep, 150
	Send, {SPACE}
	Sleep, 150
	Send, {SHIFT DOWN}{TAB}{SHIFT UP}
	Send, {BACKSPACE}
	Send, {BACKSPACE}
	Send, {BACKSPACE}
	Send, {BACKSPACE}
	Send, {BACKSPACE}
	Send, {BACKSPACE}
	Send, {BACKSPACE}

}
gosub Restore_Stored_Clipboard ;restore clipboard
return
