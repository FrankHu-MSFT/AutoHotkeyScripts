#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; From your queue view, press this button to loop and close untill done. Then press numlock to stop the script. 
^SPACE::
  Loop 38
	{
		Click 372, 155 ; click select a bucket to browse
		sleep 2000
		Click 338, 463 ; click browse
		sleep 2000
		Click 176,215 ; filter bucket list 
		sleep 1000
		Send, sec  ; Type the word security
		sleep 1000
		Click 230,439 ; filter bucket list (msdn or git, change x,y accordingly)
		sleep 4000
		Loop 10{
		 Click 364, 207 ; click item
		 sleep 2000
		 Click 413, 283 ; click tag 
		 sleep 2000
		 Send {WheelDown} ; scroll down to reingested
		 sleep 2000
		 Click 860, 900 ; click Reingested Tag
		 sleep 2000
		 Click 1299, 1023 ; press submit button
		 sleep 2000
		 Click 362, 287 ; take ownership
		 sleep 2000
		}
	  Send {Ctrl Down}r{Ctrl Up}
	  sleep 10000
	}
  return
  
  
  ^1::ExitApp