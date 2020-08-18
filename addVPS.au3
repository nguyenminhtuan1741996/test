HotKeySet("{F10}","_exit")
HotKeySet("{F9}","_run")
Local $var = 15

While 1
	Sleep(100)
WEnd

Func _exit()
	Exit
EndFunc

Func C()
	Send("^{c}")
EndFunc

Func v()
	Send("^{v}")
EndFunc

Func alttab()
	Send("!{tab}")
EndFunc

Func ctrltab()
	Send("^{tab}")
EndFunc

Func a()
	Send("^{a}")
EndFunc

Func add()
	c()
	Sleep(100)
	alttab()
	Sleep(100)
	a()
	Sleep(100)
	v()
	Sleep(100)
	ctrltab()
	Sleep(100)
	Send("{tab 5}")
	Sleep(100)
	Send("{space}")
	Sleep(100)
	Send("{tab 3}")
	Sleep(100)
	alttab()
	Sleep(100)
	Send("{tab}")
	Sleep(100)
	c()
	Sleep(100)
	alttab()
	Sleep(100)
	v()
	Sleep(100)
	Send("{tab}")
	Sleep(100)
	alttab()
	Sleep(100)
	Send("{tab}")
	Sleep(100)
	c()
	Sleep(100)
	alttab()
	Sleep(100)
	v()
	Sleep(100)
	Send("{enter}")
	Sleep(100)
	alttab()
	Sleep(100)
	Send("{down}")
	Sleep(100)
	Send("{left}")
	Sleep(100)
	Send("{left}")
EndFunc




Func _run()
	For $i = 1 To $var
		add()
	Next
EndFunc


