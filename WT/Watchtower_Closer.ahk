#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; From your queue view, press this button to loop and close untill done. Then press numlock to stop the script. 
^SPACE::
  Loop 38
	{
		Click 372, 155
		sleep 5000
		Click 319, 318
		sleep 5000
		Loop 10{
		 Click 364, 225
		 sleep 3000
		 Click 364, 280
		 sleep 3000
		 Click 278,342
		 sleep 3000
		}
	  Send {Ctrl Down}r{Ctrl Up}
	  sleep 10000
	}
  return
  
  
  numlock::ExitApp