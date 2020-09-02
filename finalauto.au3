#include <GUIConstantsEx.au3>
#include <Array.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>
HotKeySet("{f1}","tree")
HotKeySet("{f11}","_exit")
HotKeySet("{f3}","_f3")
HotKeySet("{f4}","_f4")
HotKeySet("{f5}","_f5")
HotKeySet("{f6}","_f6")
HotKeySet("{f7}","_f7")

Func _exit()
	Exit
EndFunc

$GUI = GUICreate("ADS",1000,500)
$app1 = GUICtrlCreateButton("APP1",0,0,300,100)
$app2 = GUICtrlCreateButton("APP2",300,0,300,100)
$video = GUICtrlCreateButton("VIDEO",600,0,300,100)
$smart = GUICtrlCreateButton("SMART",0,200,300,100)
$multi = GUICtrlCreateButton("MULTI",300,200,300,100)

Global $Show = True
GUISetState($Show, $GUI)
$linkvideo = "https://www.youtube.com/watch?v=pZVdQLn_E5w"
While 1
	$nMsg = GUIGetMsg()
    Switch $nMsg
        Case $GUI_EVENT_CLOSE
            Exit
        Case $app1
			HotKeySet("{f9}","_app1")
			$show = Not $show
			GUISetState($show, $GUI)
		Case $video
			HotKeySet("{f9}","_video")
			$show = Not $show
			GUISetState($show, $GUI)
		Case $app2
			HotKeySet("{f9}","_app2")
			$show = Not $show
			GUISetState($show, $GUI)
		Case $smart
			HotKeySet("^{f9}","_smart")
			HotKeySet("^{f2}","name")
			HotKeySet("^{f3}","web")
			HotKeySet("^{f4}","ok")
			HotKeySet("^{f5}","form")
			HotKeySet("^{f6}","ok2")
			HotKeySet("^{f7}","ok3")
			HotKeySet("^{f8}","ok4")
			HotKeySet("^{f10}","ok5")
			$show = Not $show
			GUISetState($show, $GUI)
			$hGUI = GUICreate("", 500, 300)
			$cEdit = GUICtrlCreateEdit("",0,10,500,200)
			GUICtrlSetData($cEdit,"")
			$cButton = GUICtrlCreateButton("Save",200,250,100,30)
			GUISetState()
			While 1
				Switch GUIGetMsg()
					Case $GUI_EVENT_CLOSE
						Exit
					Case $cButton
						Local $sText = GUICtrlRead($cEdit)
						Local $data = StringReplace($sText,@TAB,chr(13))
						FileDelete(@ScriptDir&"\smart.txt")
						FileWrite(@ScriptDir&"\smart.txt",$data)
						GUIDelete($hGUI)
				EndSwitch
			WEnd

		Case $multi
			HotKeySet("{f9}","multi")
			$show = Not $show
			GUISetState($show, $GUI)
	EndSwitch
WEnd


Func _f7()
	for $i = 1 To 15
		MouseClick('left',462, 344,1)
		Sleep(400)
		s("{tab}")
		Sleep(400)
		s("{a}")
		Sleep(400)
		s("{tab 2}")
		Sleep(400)
		s("{b}")
		Sleep(100)
		s("{r}")
		Sleep(400)
		s("{tab}")
		Sleep(400)
		S("{enter}")
		Sleep(700)
		tree()
	Next
EndFunc





Func tree()
	ControlSend("[REGEXPTITLE:(?i)(.*Remote Desktop Connection Manager v2.7*)]","","[NAME:ServerTree]","{down}")
EndFunc

Func window()
	MouseClick("left",1012, 66)
EndFunc

Func find($string)
	s("^{f}")
	Sleep(400)
	s($string)
	Sleep(400)
	s("{ESC}")
EndFunc


Func paste($clipboard)
	ClipPut($clipboard)
	Sleep(400)
	s("^{v}")
EndFunc



Func s($key)
	send($key)
EndFunc

Func _f1()
	paste("https://accounts.google.com/signin")
	Sleep(400)
	Send("{enter}")
EndFunc

Func _f2()
	paste("https://mail.google.com/mail/u/0/#inbox")
	Sleep(400)
	Send("{enter}")
EndFunc

Func _f3()
	paste("https://mail.google.com/mail/u/0/#settings/general")
	Sleep(400)
	Send("{enter}")
EndFunc

Func _f4()
	paste("https://ads.google.com/um/StartNow?subid=ww-ww-et-g-aw-a-vasquette_ads_1!o2")
	Sleep(400)
	Send("{enter}")
EndFunc


Func _f5()
	paste("https://ads.google.com/aw/campaigns/new/video")
	Sleep(400)
	Send("{enter}")
EndFunc

Func _f6()
	paste("https://bom.to/K1V68N")
	Sleep(400)
	Send("{enter}")
EndFunc


Func _video()
	#comments-start
	find("Campaign total")
	Sleep(400)
	s("{d}")
	Sleep(400)
	s("{tab}")
	Sleep(400)
	#comments-end
	s("2")
	Sleep(400)
	find("Maximum CPV bid")
	Sleep(400)
	s("{tab}")
	Sleep("500")
	s("0.01")
	Sleep(400)
	find("URL")
	Sleep(400)
	paste($linkvideo)
	Sleep(3000)
	s("{tab}")
	Sleep(400)
	s("{space}")
	Sleep(400)
	find("Final URL")
	Sleep(400)
	paste($linkvideo)
	Sleep(400)
	s("{tab 3}")
	Sleep(1000)
	find("create campaign")
	Sleep(400)
	s("{ENTER}")
EndFunc


Func _app1()
	Local $appdelay = 400
	Local $d = 1300
	find("enter an")
	Sleep($appdelay)
	Send("{space}")
	Sleep($d)
	#comments-start
	Send("{tab}")
	Sleep($appdelay)
	send("Korea")
	Sleep(300)
	Send("{right}")
	Sleep($d)
	Send("{enter}")
	Sleep($appdelay)
	send("united states")
	Sleep(300)
	Send("{right}")
	Sleep($d)
	Send("{enter}")
	Sleep($appdelay)
	send("united kingdom")
	Sleep(300)
	Send("{right}")
	Sleep($d)
	Send("{enter}")
	Sleep($appdelay)
	send("Croatia")
	Sleep(300)
	Send("{right}")
	Sleep($d)
	Send("{enter}")
	Sleep($appdelay)
	send("Japan")
	Sleep(300)
	Send("{right}")
	Sleep($d)
	Send("{enter}")
	Sleep($appdelay)
	send("Australia")
	Sleep(300)
	Send("{right}")
	Sleep($d)
	Send("{enter}")
	Sleep($appdelay)
	send("Netherlands")
	Sleep(300)
	Send("{right}")
	Sleep($d)
	Send("{enter}")
	Sleep($appdelay)
	send("Kuwait")
	Sleep(300)
	Send("{right}")
	Sleep($d)
	Send("{enter}")
	Sleep($appdelay)
	send("Mexico")
	Sleep(300)
	Send("{right}")
	Sleep($d)
	Send("{enter}")
	Sleep($appdelay)
	#comments-end
	find("Advanced search")
	Sleep(400)
	s("{enter}")
	Sleep(1500)
	MouseClick("left",441, 268,1)
	Sleep(500)
	MouseClick("left",558, 335,1)
	Sleep(300)
	paste("Vietnam"&chr(13)&"Venezuela"&chr(13)&"India"&chr(13)&"Iraq"&chr(13)&"Russia")
	Sleep(500)
	MouseClick("left",846, 439,1)
	Sleep(2000)
	MouseClick("left",806, 489,1)
	Sleep(700)
	MouseClick("left",851, 656,1)
	Sleep(700)
	s("+{tab}")
	Sleep(500)
	find("location options")
	Sleep($appdelay)
	Send("{enter}")
	Sleep($appdelay)
	find("people in or regular")
	Sleep($appdelay)
	Send("{space}")
	Sleep($appdelay)
	find("interest in, your exc")
	Sleep($appdelay)
	Send("{space}")
	Sleep($appdelay)
	find("a language")
	Sleep($appdelay)
	Send("all")
	Sleep(1000)
	Send("{down}")
	Sleep($appdelay)
	Send("{enter}")
	Sleep($appdelay)
	find("enter the average")
	Sleep($appdelay)
	Send("{tab}")
	paste("262")
	Sleep($appdelay)
	find("Target cost per install")
	Sleep($appdelay)
	Send("{tab}")
	Sleep($appdelay)
	paste("0.12")
	Sleep($appdelay)
	find("save and")
	Sleep($appdelay)
	Send("{enter}")
EndFunc


Func _app2()
	Local $d11= 400
	find("headlines (")
	Sleep($d11)
	Send("{tab 2}")
	Sleep($d11)
	paste("Dodger MultiMod for MCPE")
	Sleep(800)
	Send("{tab}")
	Sleep($d11)
	paste("Minecraft Modding AddOns")
	Sleep(800)
	Send("{tab}")
	Sleep($d11)
	paste("Minecraft Builders Mods")
	Sleep(800)
	Send("{tab 4}")
	Sleep($d11)
	paste("Our new toolbox for MCPE is filled with loads of amazing features.")
	Sleep(800)
	Send("{tab}")
	Sleep($d11)
	paste("Play any mods on Minecraft with the best MCPE automatic installer.")
	Sleep(800)
	Send("{tab}")
	Sleep($d11)
	paste("Go straight to enjoying Minecraft’s greatest mods with our app.")
	Sleep(800)
	Send("{tab 6}")
	Sleep($d11)
	send("{enter}")
	Sleep(1500)
	paste("https://www.youtube.com/watch?v=ZJHsV0uhor4")
	Sleep(2000)
	MouseClick('left',576, 371,1)
	Sleep(400)
	MouseClick('left',1234, 678,1)
	Sleep(800)
	find("Descriptions (up to 5)")
	Sleep(400)
	s("{tab 8}")
	Sleep(300)
	s("{enter}")
	Sleep(2000)
	MouseClick('left',878, 507,1)
	Sleep(1500)
	MouseClick('left',426, 159,2)
	Sleep(300)
	MouseClick('left',426, 159,2)
	Sleep(400)
	MouseClick('left',600, 260,1)
	Sleep($d11)
	s("^{a}")
	Sleep($d11)
	s("{enter}")




EndFunc


Func logmail()
	s("{left}")
	Sleep(400)
	s("{enter}")
	Sleep(3000)
	s("{left}")
	Sleep(400)
	s("{enter}")
	Sleep(3000)
	find("Confirm")
	Sleep(400)
	s("{enter}")
	Sleep(3000)
	s("{left}")
	Sleep(400)
	s("{enter}")
EndFunc
	#comments-start
	$total_line_smart = _FileCountLines(@ScriptDir&"\smart.txt")
	$end_smart = $total_line_smart/8
	$data_smart = 0
	_FileReadToArray(@ScriptDir&"\smart.txt",$data_smart)
	#comments-end

Func _smart()
	name()
	Sleep(400)
	ControlSend("[REGEXPTITLE:(?i)(.*Remote Desktop Connection Manager v2.7*)]","","[NAME:ServerTree]","{up 14}")
	Sleep(300)
	web()
	Sleep(3000)
	ControlSend("[REGEXPTITLE:(?i)(.*Remote Desktop Connection Manager v2.7*)]","","[NAME:ServerTree]","{up 14}")
	Sleep(300)
	ok()
	Sleep(400)
	ControlSend("[REGEXPTITLE:(?i)(.*Remote Desktop Connection Manager v2.7*)]","","[NAME:ServerTree]","{up 14}")
	Sleep(300)
	ok2()
	Sleep(400)
	ControlSend("[REGEXPTITLE:(?i)(.*Remote Desktop Connection Manager v2.7*)]","","[NAME:ServerTree]","{up 14}")
	Sleep(300)
	ok3()
	ControlSend("[REGEXPTITLE:(?i)(.*Remote Desktop Connection Manager v2.7*)]","","[NAME:ServerTree]","{up 14}")
	Sleep(300)
	ok4()
	ControlSend("[REGEXPTITLE:(?i)(.*Remote Desktop Connection Manager v2.7*)]","","[NAME:ServerTree]","{up 14}")
	Sleep(300)
	ok5()


EndFunc

Func name()
	$total_line_smart = _FileCountLines(@ScriptDir&"\smart.txt")
	$end_smart = $total_line_smart/8
	Local $data_smart = 0
	_FileReadToArray(@ScriptDir&"\smart.txt",$data_smart)
	$date = InputBox("date","date")
	$i=1
	For $a =1 To $end_smart
		window()
		Sleep(400)
		paste($data_smart[$i]&" "&$date)
		Sleep(400)
		find("NEXT")
		Sleep(400)
		s("{enter}")
		Sleep(700)
		tree()
		$i+=8
	Next
EndFunc

Func web()
	$total_line_smart = _FileCountLines(@ScriptDir&"\smart.txt")
	$end_smart = $total_line_smart/8
	$data_smart = 0
	_FileReadToArray(@ScriptDir&"\smart.txt",$data_smart)
	$i=2
	For $a =1 To $end_smart
		window()
		Sleep(400)
		paste($data_smart[$i])
		Sleep(400)
		find("NEXT")
		Sleep(400)
		s("{enter}")
		Sleep(700)
		tree()
		$i+=8
	Next
EndFunc

Func ok()
	$total_line_smart = _FileCountLines(@ScriptDir&"\smart.txt")
	$end_smart = $total_line_smart/8
	For $i = 1 To $end_smart
		window()
		Sleep(400)
		find("next")
		Sleep(500)
		s("{enter}")
		Sleep(700)
		tree()
	Next

EndFunc

Func form()
	$total_line_smart = _FileCountLines(@ScriptDir&"\smart.txt")
	$end_smart = $total_line_smart/8
	$data_smart = 0
	_FileReadToArray(@ScriptDir&"\smart.txt",$data_smart)
	$i=4
	For $a = 1 To $end_smart
		MouseClick('left',462, 344,1)
		Sleep(300)
		s("{tab}")
		Sleep(300)
		paste($data_smart[$i])
		Sleep(300)
		s("{tab}")
		Sleep(300)
		paste($data_smart[$i+1])
		Sleep(300)
		s("{tab}")
		Sleep(300)
		paste($data_smart[$i+2])
		Sleep(300)
		s("{tab}")
		Sleep(300)
		paste($data_smart[$i+3])
		Sleep(300)
		s("{tab}")
		Sleep(300)
		paste($data_smart[$i+4])
		Sleep(300)
		s("{tab 2}")
		Sleep(300)
		s("{b}")
		Sleep(300)
		s("{r}")
		Sleep(300)
		s("{tab}")
		Sleep(300)
		paste($data_smart[$i-1])

Sleep(300)
		find("next")
		Sleep(400)
		s("{enter}")
		Sleep(700)
		tree()
		$i+=8
	Next

EndFunc

Func ok2()
	$total_line_smart = _FileCountLines(@ScriptDir&"\smart.txt")
	$end_smart = $total_line_smart/8
	For $i = 1 To $end_smart
		MouseClick('left',462, 344,1)
		Sleep(300)
		find("adver")
		Sleep(300)
		s("{tab}")
		Sleep(300)
		s("{b 2}")
		Sleep(150)
		s("{BS 10}")
		Sleep(150)
		s("{p}")
		Sleep(150)
		s("{o}")
		Sleep(500)
		MouseClick('left',696, 434,1)
		Sleep(300)
		MouseClick('left',687, 465,1)
		Sleep(300)
		MouseClick('left',833, 474,1)
		Sleep(300)
		MouseClick('left',822, 429,1)
		Sleep(300)
		MouseClick('left',694, 360,1)
		Sleep(300)
		MouseClick('left',694, 360,1)
		Sleep(300)
		MouseClick('left',694, 360,1)
		Sleep(300)
		MouseClick('left',694, 360,1)
		Sleep(300)
		MouseClick('left',696, 434,1)
		Sleep(300)
		MouseClick('left',833, 474,1)
		Sleep(300)
		s("^{f}")
		Sleep(500)
		s("next")
		Sleep(500)
		s("{esc}")
		Sleep(500)
		s("{enter}")
		Sleep(700)
		tree()
	Next

EndFunc

Func ok3()
	$total_line_smart = _FileCountLines(@ScriptDir&"\smart.txt")
	$end_smart = $total_line_smart/8
	For $i = 1 To $end_smart
		MouseClick('left',462, 344,1)
		find("near")
		Sleep(500)
		s("{space}")
		Sleep(2000)
		s("{tab 9}")
		Sleep(300)
		s("{left 25}")
		Sleep(500)
		find("next")
		Sleep(500)
		s("{enter}")
		Sleep(700)
		tree()
	Next
EndFunc

Func ok4()
	$total_line_smart = _FileCountLines(@ScriptDir&"\smart.txt")
	$end_smart = $total_line_smart/8
	For $i = 1 To $end_smart
		MouseClick('left',462, 344,1)
		find("enter your")
		Sleep(500)
		s("{space}")
		Sleep(2000)
		s("{tab 3}")
		Sleep(300)
		s("{left 200}")
		Sleep(500)
		find("next")
		Sleep(500)
		s("{enter}")
		Sleep(700)
		tree()
	Next
EndFunc

Func ok5()
	$total_line_smart = _FileCountLines(@ScriptDir&"\smart.txt")
	$end_smart = $total_line_smart/8
	For $i = 1 To $end_smart
		MouseClick('left',462, 344,1)
		Sleep(300)
		find("next")
		Sleep(500)
		s("{enter}")
		Sleep(700)
		tree()
	Next
EndFunc









Func multi()
	Local $func = InputBox("function","function")
	For $i=1 to 15
		window()
		Sleep(300)
		If $func == 'app1' Then
			_app1()
		ElseIf $func == 'app2' Then
			_app2()
		ElseIf $func == 'video' Then
			_video()
		EndIf
		Sleep(1200)
		tree()
	Next
	Beep(500, 700)
EndFunc


