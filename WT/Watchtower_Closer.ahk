#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; --------------------------------------------------------------------------------------------------------------


; with https://wt.microsoft.com/respond/ url pulled up you can close out all your issues in your current bucket. 
; Then press Ctrl + Space to start the script.
; Then press Ctrl + 1 to stop the script.



; there are some requirements to get it to work properly :
; 1. the browser needs to be in focus,
; 2. the x,y positions need to be correct for the clicks (you can change the x,y positions in the script.
;        a. Use window spy to get the right x y positions : https://autohotkey.com/board/topic/63365-using-window-spy/)
;            So the click x,y needs to be changed to click on the items per your screen dimension. See 
;            https://github.com/FrankHu-MSFT/AutoHotkeyScripts/blob/master/Gifs/AutoHotKeyWTClosure.gif
;            for a small gif on how it is supposed to auto click.
; 





; TODO: Change the 5 clicks below to the correct x,y positions per your screen dimensions. 
^SPACE::
  Loop 38 ; Loop 38 times. 
	{
		Click 372, 155 ; clicks on queue bar
		sleep 5000
		Click 319, 318 ; clicks on queue from the drop down menu
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
  
  
  ^1::ExitApp ; press numlock to stop and exit the script. 
