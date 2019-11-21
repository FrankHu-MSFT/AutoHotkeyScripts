#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; ----------- To get key information, remove the semicolons before lines 8,9, and 10. 
; #InstallKeybdHook
; #InstallMouseHook
; KeyHistory



; Numpad_clear : maps to Escape key,
; Numpad_backspace :  backspace - maps to actual backspace...
; Numpad_calc : Calc is - Launch_App2,
; NumpadDot : is the dot. 

; Launch_App2::
; Send, test


;***********Map NumpadDot to Control******************* 
NumpadDot::Control


;***********Map NumPad0 to Alt******************* 
Numpad0::Alt

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
gosub apply_label
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
gosub apply_label
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
Send,@
Sleep, 150
Send,{CTRL DOWN}v{CTRL UP}
Sleep, 150
Send, Please let us know if there are anymore questions within the scope of this git issue. If not, I will be closing out this git issue by end of day today. Please file a new git issue with a reference to this one if you have anymore concerns. Thanks
return


;***********Templated Response for Closing GitHub******************* 
^Numpad7::
Send,@
Sleep, 150
Send,{CTRL DOWN}v{CTRL UP}
Sleep, 150
Send, As there hasn't been a response in a while, I will be closing out this git issue now. Please file a new git issue with a reference to this one if you have anymore concerns. Thanks
return

;***********Templated Response for Following up on GitHub******************* 
!Numpad7::
Send,@
Sleep, 150
Send,{CTRL DOWN}v{CTRL UP}
Sleep, 150
Send, I'm following up on this issue, can you please respond in regards to the previous replies on this thread? Thanks
return

;***********Tag Github Issue with CXP, Triaged, and doc-enhancement*******************
Numpad8::
gosub label_cxp_and_triage
Send, doc-enhancement
gosub apply_label
WinGetPos,,,Xmax,Ymax,A ; get active window size
Xcenter := Xmax/4        ; Calculate quarter of window, so we move to the quarter left of the screen to click. nothing there on git
Ycenter := Ymax/2
ControlClick, x%Xcenter% y%Ycenter%, A
return

;***********Templated Response for Old Proposed/Answered MSDN******************* 
Numpad9::
Send, `n Please remember to mark one of the responses as answer if your question has been answered. If not please let us know if there are anymore questions. Thanks!
return


;***********Templated Response for UnAnswered MSDN******************* 
^Numpad9::
Send, I'm following up on this please let us know if there are anymore questions. In order to progress this issue forward, we will need you to reply/respond in regards to the replies above. Thanks!
return


;***********Templated Response for Marking an Answer on MSDN******************* 
!Numpad9::
Send, I'm following up on this please let us know if there are anymore questions. As it looks like this issue has been resolved within the scope of the MSDN Thread Question, I will be marking the response as answer. Please let me know if your question has not been answered, and I can go ahead and unmark it as answer or feel free to mark it as unanswer yourself. Also please remember to post future questions on the new Q&A Forums here : https://docs.microsoft.com/answers/index.html Thanks!
return


;***********Tag Github Issue with CXP, Triaged, and doc-bug*******************
NumpadDiv::
gosub label_cxp_and_triage
Send, doc-bug
gosub apply_label
WinGetPos,,,Xmax,Ymax,A ; get active window size
Xcenter := Xmax/4        ; Calculate quarter of window, so we move to the quarter left of the screen to click. nothing there on git
Ycenter := Ymax/2
ControlClick, x%Xcenter% y%Ycenter%, A
return


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


;***********forwards tab******************* 
NumpadAdd::
Send, {CTRL DOWN}{tab}{CTRL UP}
return

; Usually I use numpadenter as a tester, when I'm not using it as tester, i use it for shift + tab to go backwards through tabs
;***********backwards tab******************* 
NumpadEnter::
Send, {CTRL DOWN}{SHIFT DOWN}{tab}{CTRL UP}{SHIFT UP}
return

;***********Emergency Stop******************* 
NumLock::ExitApp



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
; begin labeling
myStringVar = cxp
Send, %myStringVar%
gosub apply_label
Loop, Parse, myStringVar
	Send, {BACKSPACE}
     
myStringVar = triaged
Send, %myStringVar%
gosub apply_label
Loop, Parse, myStringVar
	Send, {BACKSPACE}

gosub Restore_Stored_Clipboard ;restore clipboard
return

;************************************* Apply The Label *************************************
apply_label:
Sleep, 500
Send, {TAB}
Sleep, 150
Send, {SPACE}
Sleep, 150
return