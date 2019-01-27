#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Sleep, 100
Send {LWin down}
Sleep, 25
Send {Left down}
Sleep, 25
Send {Left up}
Sleep, 25
Send {Up down}
Sleep, 25
Send {Up up}
Sleep, 25
Send {LWin up}
Sleep, 500

Run explore "F:\\Users\\Silver\\Documents\\GitHub\\Starbound-Wardrobe-Addons"
Sleep, 1000
Send {LWin down}
Sleep, 25
Send {Left down}
Sleep, 25
Send {Left up}
Sleep, 25
Send {Down down}
Sleep, 25
Send {Down up}
Sleep, 25
Send {LWin up}
Sleep, 500

Run explore "F:\\Steam\\steamapps\\common\\Starbound\\mods"
Sleep, 1000
Send {LWin down}
Sleep, 25
Send {Right down}
Sleep, 25
Send {Right up}
Sleep, 25
Send {Up down}
Sleep, 25
Send {Up up}
Sleep, 25
Send {LWin up}
Sleep, 500

Run explore "F:\\Steam\\steamapps\\workshop\\content\\211820"
Sleep, 1000
Send {LWin down}
Sleep, 25
Send {Right down}
Sleep, 25
Send {Right up}
Sleep, 25
Send {Down down}
Sleep, 25
Send {Down up}
Sleep, 25
Send {LWin up}
Sleep, 500

Send {Esc}
Sleep, 10

Run, "C:\\Program Files\\paint.net\\PaintDotNet.exe"
