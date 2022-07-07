#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
SetTitleMatchMode 2
SetKeyDelay -1
;执行间隔(毫秒)
global triggerInterval:=50
;执行按键
global bindKey:="F8"
;以下为程序运行变量,不需要修改
;活动窗口标题
activeTitle:="nil"
;活动窗口ID
active_id:=00124001244723
;运行标识
running:=0
;ctrl+F9启动, 关闭
^F9::
    { 
        ;获取当前激活窗口标题
        WinGetActiveTitle, activeTitle
        ;获取当前激活窗口的AHK_ID
        WinGet, active_id , ID, %activeTitle%
        running:=!running
        if (running=0) {
            SoundPlay, %A_ScriptDir%\..\resources\Sound\off.wav
            MsgBox, 关闭自动执行!
            SetTimer, MyCommond, Off
        } else {
            SoundPlay, %A_ScriptDir%\..\resources\Sound\on.wav
            MsgBox, 开始自动执行! 当前窗口名称: %activeTitle%, 当前窗口ID: %active_id%
            SetTimer, MyCommond, %triggerInterval%
        }
    }
Return

MyCommond:
    { 
        ;获取VK,SC
        VK:=GetKeyVK(bindKey), SC:=GetKeySC(bindKey)
        PostMessage, 0x100, VK, SC,, ahk_id %active_id%
        PostMessage, 0x101, VK, SC,, ahk_id %active_id%
    }
Return