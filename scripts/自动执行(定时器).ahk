Process,priority, , high  ;脚本进程优先级为高
;#NoTrayIcon 显示图标
#Persistent ;让脚本持久运行
#SingleInstance,Force ;决定当脚本已经运行时是否允许它再次运行。

;===========================================================
;** 循环执行设定的按键(定时器版本,CPU性能消耗小)
;** ctrl+alt+UP开启 ctrl+alt+Down关闭
;===========================================================

;执行间隔(毫秒)
triggerInterval := 50
;执行按键
bindKey := "{F6}"
;活动窗口标题(不需要修改)
activeTitle := "未知"
;活动窗口ID(不需要修改)
active_id := 00124001244723


^!Up::
;获取当前激活窗口标题
WinGetActiveTitle, activeTitle
;获取当前激活窗口的AHK_ID
WinGet, active_id , ID, %activeTitle%
SoundPlay, %A_ScriptDir%\..\resources\Sound\on.wav
MsgBox, 开始自动执行! 当前窗口名称: %activeTitle%, 当前窗口ID: %active_id%
;开启定时器
SetTimer, SendMyKey, On, %triggerInterval%
Return

^!Down::
SoundPlay, %A_ScriptDir%\..\resources\Sound\off.wav
MsgBox, 关闭自动执行!
;关闭定时器
SetTimer, SendMyKey, Off
Return

;定时器操作, 可以在这里添加一些自己的需要执行的逻辑
SendMyKey:
controlsend,,%bindKey%,ahk_id %active_id%
Return