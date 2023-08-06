#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=C:\Program Files (x86)\AutoIt3\Icons\MyAutoIt3_Blue.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <Array.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <AutoItConstants.au3>
OnAutoItExitRegister("_exit")
local $pid
$pgnrecorder = "5dpgn recorder specialised for all variants and puzzle speedrun.exe"
If FileExists($pgnrecorder) = False Then
	MsgBox(16,"Error couldnt find customized pgn reader","couldnt find the customized pgn reader under the name" & @CRLF & $pgnrecorder)
	Exit
EndIf
#Region ### START Koda GUI section ### Form=
$Form1_1 = GUICreate("5d chess timer helper", 262, 69, 806, 274)
$Input1 = GUICtrlCreateInput("{f1}", 8, 32, 121, 21)
$Label1 = GUICtrlCreateLabel("hotkey of splitsoftware", 8, 8, 112, 17)
$Button1 = GUICtrlCreateButton("start", 176, 8, 75, 25)
$Button2 = GUICtrlCreateButton("stop", 176, 32, 75, 25)
GUICtrlSetState($button2,128)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $button1
			$pid = Run($pgnrecorder,"",@SW_HIDE,$STDOUT_CHILD)
		    if @error Then MsgBox(64,@error,"error occured while starting the pgn reader pls provide number in the title")
			ProcessWait($pid)
			GUICtrlSetState($button1,128)
			GUICtrlSetState($Input1,128)
			GUICtrlSetState($button2,64)
			While 1
				$nMsg = GUIGetMsg()
				Switch $nMsg
					Case $GUI_EVENT_CLOSE
						Exit
					Case $button2
						ProcessClose($pid)
						ProcessWaitClose($pid)
						GUICtrlSetState($button1,64)
						GUICtrlSetState($Input1,64)
						GUICtrlSetState($button2,128)
						ExitLoop
				EndSwitch
				$stdout = StdoutRead($pid)
				If StringInStr($stdout,'White "O') Then
					$color = 0
				Else
					$color = 1
				EndIf
				If (($color and StringInStr($stdout,"EndedWhiteWon")) Or (StringInStr($stdout,"EndedBlackWon") and $color = 0)) Then
					Send(GUICtrlRead($Input1))
				EndIf
			WEnd
	EndSwitch
WEnd

func _exit()
	if ProcessExists($pid) then ProcessClose($pid)
EndFunc
