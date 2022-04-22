Process,priority, , high  ;脚本进程优先级为高
#NoTrayIcon
;==================================================
;** 调整音量  win+> 放大 win+< 缩小 win+/ 静音
;==================================================
;Change volume
 #.:: Send {Volume_Up} ;Ctrl + NumPad Plus
 #,:: Send {Volume_Down} ;Shift + NumPad Minus
 #/::Send {Volume_Mute} ; Break key (mute)
 return