#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;弹窗
;MsgBox, 开始自动执行! 当前窗口名称: %activeTitle%, 当前窗口ID: %active_id%

;获取当前窗口ID
;WinGet, active_id , ID, %activeTitle%

;获取当前激活窗口Title
;WinGetActiveTitle, activeTitle


;最大化当前窗口
;WinMaximize, ahk_id %active_id%


;发送后台按键
;controlsend,,{F6},ahk_id %active_id%

;发送普通按键
;Send {F6}

;播放本地音频
;SoundPlay, %A_ScriptDir%\..\resources\Sound\off.wav