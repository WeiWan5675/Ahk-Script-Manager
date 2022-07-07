Process,priority, , high  ;脚本进程优先级为高
;#NoTrayIcon
#Persistent ;让脚本持久运行
#SingleInstance,Force ;决定当脚本已经运行时是否允许它再次运行。

;===========================================================
;** 循环执行设定的按键, ctrl+alt+Home开启 ctrl+alt+End关闭
;===========================================================
;设置运行Flag
stopFlag := true
;执行间隔(毫秒)
triggerInterval := 50
;执行按键
bindKey := "{F6}"
;活动窗口标题(不需要修改)
activeTitle := "未知"
;活动窗口ID(不需要修改)
active_id := 00124001244723


^!Home::
stopFlag := true
WinGetActiveTitle, activeTitle
WinGet, active_id , ID, %activeTitle%
SoundPlay, %A_ScriptDir%\..\resources\Sound\on.wav
MsgBox, 开始自动执行! 当前窗口名称: %activeTitle%, 当前窗口ID: %active_id%
while (stopFlag)
{ 
    Sleep, %triggerInterval%
	controlsend,,%bindKey%,ahk_id %active_id%
    if (!stopFlag)
    {
        break
    }
}
Return

^!End::
SoundPlay, %A_ScriptDir%\..\resources\Sound\off.wav
MsgBox, 关闭自动执行
stopFlag := false
Return
