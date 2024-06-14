#NoEnv
#Singleinstance, Force

Menu, Tray, Tip, AnythingOnTop

Menu, Tray, NoStandard
Menu, Tray, Add, Stick, StickHelp
Menu, Tray, Add, Unstick, Unstick
Menu, Tray, Add
Menu,Tray, Standard

CurrentlyStuck := ""

StickHelp() {
	MsgBox, , AnythingOnTop, Use F9 to stick %title%
}

F9::
HandleStick()
return

HandleStick()
{
	Unstick()
	WinGetTitle, title, A
	MsgBox, 0x4, AnythingOnTop, Stick?`nThis will make the window on top and non-interactible until unstuck.`n`n%title%,10	
	IfMsgBox Yes
		Stick()
}

Stick()
{
	global CurrentlyStuck
	WinGet, current, ID, A
	CurrentlyStuck := current
	WinSet, AlwaysOnTop, On, ahk_id %current%
	WinSet, ExStyle, +0x80020, ahk_id %current%
}

Unstick()
{	
	global CurrentlyStuck
	WinSet, AlwaysOnTop, Off, ahk_id %CurrentlyStuck%
	WinSet, ExStyle, -0x80020, ahk_id %CurrentlyStuck%
}

OnExit("Unstick")
