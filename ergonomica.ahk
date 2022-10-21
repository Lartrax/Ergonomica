#NoEnv
#SingleInstance, Force
SendMode, Input
SetBatchLines, -1
SetWorkingDir, %A_ScriptDir%
CoordMode, ToolTip, Screen

If (A_ScreenDPI > 0){
    correction := 100
    If (A_ScreenDPI > 110){
        correction := 125
        If (A_ScreenDPI > 135){
            correction := 150
            If (A_ScreenDPI > 160){
                correction := 175
                If (A_ScreenDPI > 185){
                    correction := 200
                }
            }
        }
    }
}
scrnS := ((correction)/100)
scrnH := A_ScreenHeight/scrnS
scrnW := A_ScreenWidth/scrnS

invisCol = 00EE00
Gui, +LastFound +AlwaysOnTop -Caption -Border +ToolWindow +E0x20 ; lets you click through gui
Gui, Color, %invisCol%
Gui, Font, s128
Gui, Add, Text, +Center w%scrnW% cLime, Slutt å sjå på skjermen
Gui, Add, Text, +Center w%scrnW% cLime vTimer
WinSet, TransColor, %invisCol% 254

Goto, MinuteTimer

SecTimer:
    Gui, Show, x0 y0 w%scrnW% h%scrnH%
    time := 26
    Loop, 25 {
        time --
        GuiControl,, Timer, %time%
        Sleep, 1000
        SoundBeep
    }
    SoundBeep, 1000, 500
    Goto, MinuteTimer
Return

MinuteTimer:
    Gui, Hide
    minutes := 20
    ToolTip, Ergonomica    %minutes%⏰, 0, %A_ScreenHeight%
    Loop, 20 {
        Sleep, 60000
        minutes --
        ToolTip, Ergonomica    %minutes%⏰, 0, %A_ScreenHeight%
    }

    SoundBeep, 1000, 500
    Goto, SecTimer
Return