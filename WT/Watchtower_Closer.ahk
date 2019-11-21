#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; From your queue view, press this button to loop and close untill done. Then press numlock to stop the script.

; with https://wt.microsoft.com/respond/ url pulled up you can close out all your issues in your current bucket. 
; Only works on standard work monitor

^SPACE::
  Loop 38 ; Loop 38 times. 
	{
		Click 372, 155 ; clicks on browse bucket 
		sleep 5000
		Click 319, 318 ; clicks on queue
		sleep 5000
		Loop 10{ ; run every 10 times, then refresh due to inconsistencies with WT
		 Click 364, 225 ; clicks on top item in bucket  
		 sleep 3000
		 Click 364, 280 ; clicks on close item
		 sleep 3000
		 Click 278,342 ; clicks fixed issue
		 sleep 3000
		}
	  Send {Ctrl Down}r{Ctrl Up} ; refresh the page to reset watchtower for resiliency purposes. 
	  sleep 10000
	}
  return
  
  
  numlock::ExitApp ; press numlock to stop and exit the script. 
