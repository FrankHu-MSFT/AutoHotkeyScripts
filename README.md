# AutoHotkeyScripts

This is a small AutoHotKey Script to get git author name, label github questions, and post templates for Git IR, MSDN Follow up, and git follow up, and some other things.

Autohotkey is a way to press a bunch of keys, when pressing one key. 
This script converts the number keypad into a set of macros. 

I've begun using this and figured to share it out to the team to see if anyone's interested in using it. 

# Installation
*From the guide*

Before learning to use AutoHotkey (AHK), you will need to download it. 

After downloading it, you may possibly need to install it. But that depends on the version you want. For this guide we will use the Installer since it is easiest to set up.

Click Download: https://autohotkey.com/download/ahk-install.exe

During installation of AutoHotkey, you will be asked to choose from UNICODE or ANSI. In short, you would probably want to choose UNICODE. It has support for non-English letters and numbers (characters). 

Keep going until you see an Install button.

Once you're done, you can double click a AHK Script to run the script. 

![](Gifs/Run_AHK_Script.gif)

If there are any questions about installing AutoHotKey, and running the scripts please let me know. 


*Official Docs*

To install ahk - https://www.autohotkey.com/download/

A short tutorial on how to use authotkey : https://www.autohotkey.com/docs/Tutorial.htm

# Stopping Scripts

You can stop a script by going to your task bar and right clicking and stopping it. 

![](Gifs/Exit_Script.gif)

# Setting Up Scripts to Run on Startup

All executables you want to run on startup can be found in the folder path : 

`C:\Users\<replace-your-username>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

So if you would like for the an autohotkey to run on startup, create a shortcut of an autohotkey and put it in the startup folder. 
See the gif below.

![](Gifs/Run_On_Startup.gif)

# Functionality

**1. Get Github Author Name**
![](Gifs/1_Get_OP_Name.gif)


**2. label github question as product-question**
![](Gifs/2_Label_Product_Question.gif)


**3. paste github template with author name. (You have to get the author name first by pressing 1)**
![](Gifs/3_Initial_Response.gif)


**4. opens notepad++**
![](Gifs/4_Open_Notepad++.gif)


**5. label github question as product-feedback**
![](Gifs/5_Label_Feedback.gif)


**6. decodes URL and wraps on parameters (for getting jwt tokens)**
![](Gifs/6_Decode_URL_Wrap_Params.gif)


**7. Github follow up response template. Has three variations, hold 0 or 7 for different variation. (You have to get the author name first by pressing 1)** 
![](Gifs/7_GitHub_Follow_Up.gif)
![](Gifs/7+0_GitHub_Follow_Up.gif)
![](Gifs/7+Dot_GitHub_Follow_Up.gif)


**8. doc-enhancement label for github issues**
![](Gifs/8_Label_Doc_Enhancement.gif)


**9. msdn followup template. Has three variations, hold 0 or 7 for different variation.**
![](Gifs/9_MSDN_Follow_Up.gif)
![](Gifs/9+0_MSDN_Follow_Up.gif)
![](Gifs/9+Dot_MSDN_Follow_Up.gif)


**clear - Does nothing**
![](1_Get_OP_Name.gif)


**Divide - (the key / ) labels git issue as a doc-bug**
![](Gifs/Divide_Label_Doc_Bug.gif)


**+ - Alt Tabs**
![](Gifs/+_Alt_Tab.gif)

**Enter - Shift Alt Tabs**
![](Gifs/Enter_Shift_Alt_Tab.gif)

**Mult - URL Encodes text**

**Minus/-NumpadSub decodes url**

**NumLock  - Emergency Exit Button**

Please reach out to FRHU, if you're interested in a short video of me using it. 

# Support
If there are any issues in regards to this sample, please file a GitHub issue. This sample is not supported by Azure Support or Microsoft nor is this AHK associated with Microsoft.
