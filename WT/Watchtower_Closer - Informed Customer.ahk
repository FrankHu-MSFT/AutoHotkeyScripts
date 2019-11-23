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


; Informed customer is for proposed answers and verified answers on MSDN, filter with proposed and verified answer.


; TODO: Change the 5 clicks below to the correct x,y positions per your screen dimensions. 
^SPACE::
  Loop 38 ; Loop 38 times here, it's a multiple of 10. So if you want it to be 500 times, you would change it to 50. 
	{
		Click 372, 155 ; clicks on queue bar
		sleep 2000
		Click 319, 318 ; clicks on queue from the drop down menu
		sleep 3000
		Loop 10{ ; run every 10 times, then refresh due to inconsistencies with WT
		 Click 364, 225 ; clicks on top item in bucket  
		 sleep 2000
		 Click 374, 282 ; clicks close issue button
		 sleep 2000
		 Click 192, 515 ; clicks fixed issue
		 sleep 2000
		}
	  Send {Ctrl Down}r{Ctrl Up} ; refresh the page to reset watchtower for resiliency purposes. 
	  sleep 10000
	}
  return
  
  
  ^1::ExitApp ; press ctrl + 1 to stop and exit the script. 
