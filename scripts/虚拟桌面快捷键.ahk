Process,priority, , high  ;脚本进程优先级为高
#NoTrayIcon

;==================================================
;** 修改切换虚拟桌面快捷键
;==================================================
#Up::
Send #^{d}
WinActivate ahk_class Shell_TrayWnd
Return
#Down::
Send #^{F4}
WinActivate ahk_class Shell_TrayWnd
Return
#Left::
Send #^{Left}
WinActivate ahk_class Shell_TrayWnd
Return
#Right::
Send #^{Right}
WinActivate ahk_class Shell_TrayWnd
Return