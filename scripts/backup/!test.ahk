#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
/*
;-------------------------------
;  后台发送按键和操作鼠标 By FeiYue
;
;  使用说明：
;  1、首先需要管理员权限
;  2、后台发送按键，要获取控件句柄
;  3、后台操作鼠标，要获取窗口句柄和窗口坐标
;-------------------------------
*/
;-- 测试：打开记事本，放到后台，发送一些字母，然后发送 Alt+F4 关闭窗口
F1::
    Run, notepad.exe,,, pid
    WinWait, ahk_pid %pid%,, 3
    WinSet, Bottom,, ahk_pid %pid%
    Sleep, 1000
    ;-- 可以用这个命令直接获取控件的句柄
    MouseGetPos,,,, hwnd, 2
    ;-- 也可以通过 标题和类名 获取控件的句柄
    hwnd:=后台.获取控件句柄("ahk_pid " pid, "Edit1")
    后台.发送按键(hwnd, "a")
    后台.发送按键(hwnd, "+b")
    后台.发送按键(hwnd, "!F4")
return
F2::
    ;-- 可以用这个命令直接获取窗口的句柄
    MouseGetPos,,, hwnd
    ;-- 也可以用WinExist获取窗口的句柄
    hwnd:=WinExist("ahk_class 360se6_Frame")
    后台.移动鼠标(hwnd, 997, 131)
    ; 后台.点击左键(hwnd, 999, 131)
    ; 后台.点击右键(hwnd, 999, 131)
return
;========== 下面是类和函数 ==========

;