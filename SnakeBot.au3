Global $locs[3][2]
Global $notFinished = True

;Hard-coding coordinate for bottom left corner
$locs[0][0] = 597
$locs[0][1] = 706

;bottom right (one square to the left)
$locs[1][0] = 1093
$locs[1][1] = 706

;top right corner
$locs[2][0] = 1101
$locs[2][1] = 458

HotKeySet("{PAUSE}",  "startLaundry")
Func startLaundry()
	Send("{SPACE}")
	Sleep(60)
	Send("{RIGHT}")
	Sleep(1900)
	Send("{DOWN}")
	Sleep(40)
	Send("{LEFT}")
	
	For $i = 0 To 300
	For $height = 0 To 30
		$direction = Mod($height, 2)
		
		While (PixelGetColor($locs[$direction][0], $locs[$direction][1] - $height * 8) <> 5592456)
			Sleep(10)
		WEnd
		 
		turn($direction)
		Sleep(3500)
	Next
	
	While (PixelGetColor($locs[2][0], $locs[2][1]) <> 5592456)
		Sleep(10)
	WEnd
	
	Send("{DOWN}")
	Sleep(500)
	
	While (PixelGetColor($locs[2][0], $locs[0][1]) <> 5592456)
		Sleep(10)
	WEnd
	
	Send("{LEFT}")
	Next
	
	$notFinished = False
EndFunc

Func turn($dir)
	Send("{UP}")
	Sleep(40)
	
	If ($dir = 1) Then
		Send("{LEFT}")
	Else
		Send("{RIGHT}")
	EndIf
EndFunc

;~ HotKeySet("a",  "addLocation")
;~ Func addLocation()
;~ 	$loc = MouseGetPos(0)
;~ 	$loc2 = MouseGetPos(1)
;~ 	MsgBox(1, "a", $loc &" "& $loc2)
;~ EndFunc

While ($notFinished)
	sleep(100)
WEnd


;~ Func startTest()
;~ 	$x = $locs[0][0]
;~ 	$y = $locs[0][1]
;~ 	
;~ 	$tempY = $y
;~ 	
;~ 	While (PixelGetColor($x, $tempY) = $snakeBlue)
;~ 		$pixelTotal += 1
;~ 		$tempY -= 1
;~ 	WEnd
;~ 	
;~ 	$tempY = $y + 1
;~ 	
;~ 	While (PixelGetColor($x, $tempY) = $snakeBlue)
;~ 		$pixelTotal += 1
;~ 		$tempY += 1
;~ 	WEnd
;~ 		
;~ 	MsgBox(1, "A", $pixelTotal)	
;~ EndFunc