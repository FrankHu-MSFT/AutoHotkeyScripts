﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Always on Top, keeps the current window you have on top.
; Press Ctrl + Space, to set the current windows to always be on top, and do ctrl+space again to remove it from being always on top.
^SPACE:: Winset, Alwaysontop, , A ; ctrl + space
Return
