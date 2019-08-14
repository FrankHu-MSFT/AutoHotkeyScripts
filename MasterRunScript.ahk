#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;##### Master.ahk
Run, %A_WorkingDir%\Main_Keyboard_Macros\Always_On_Top.ahk
Run, %A_WorkingDir%\Main_Keyboard_Macros\CapsLocktoControl.ahk
Run, %A_WorkingDir%\Main_Keyboard_Macros\KeyStates.ahk
Run, %A_WorkingDir%\Num_Pad_Macros\NumKeyMacros.ahk
ExitApp