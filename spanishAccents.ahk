#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

lastPressed := ""
lastTimer := ""

$e::
	handleHotkey("e", "e", "�")
	return

$e UP::
	handleHotkeyUp("e")
	return

$+E::
	handleHotkey("E", "E", "�")
	return

$+E UP::
	handleHotkeyUp("E")
	return

$u::
	handleHotkey("u", "u", "�")
	return

$u UP::
	handleHotkeyUp("u")
	return

$+U::
	handleHotkey("U", "U", "�")
	return

$+U UP::
	handleHotkeyUp("U")
	return

$y::
	handleHotkey("y", "y", "�")
	return

$y UP::
	handleHotkeyUp("y")
	return

$+Y::
	handleHotkey("Y", "Y", "�")
	return

$+Y UP::
	handleHotkeyUp("Y")
	return

$i::
	handleHotkey("i", "i", "�")
	return

$i UP::
	handleHotkeyUp("i")
	return

$+I::
	handleHotkey("I", "I", "�")
	return

$+I UP::
	handleHotkeyUp("I")
	return

$o::
	handleHotkey("o", "o", "�")
	return

$o UP::
	handleHotkeyUp("o")
	return

$+O::
	handleHotkey("O", "O", "�")
	return

$+O UP::
	handleHotkeyUp("O")
	return

$a::
	handleHotkey("a", "a", "�")
	return

$a UP::
	handleHotkeyUp("a")
	return

$+A::
	handleHotkey("A", "A", "�")
	return

$+A UP::
	handleHotkeyUp("A")
	return

$n::
	handleHotkey("n", "n", "�")
	return

$n UP::
	handleHotkeyUp("n")
	return

$+N::
	handleHotkey("N", "N", "�")
	return

$+N UP::
	handleHotkeyUp("N")
	return

$+1::
	handleHotkey("!", "{!}", "�")
	return

$+1 UP::
	handleHotkeyUp("!")
	return

$+/::
	handleHotkey("?", "{?}", "�")
	return

$+/ UP::
	handleHotkeyUp("?")
	return


handleHotkey(char, sendChar, accentChar) {
	global lastPressed
	global lastTimer

	if (!(char == lastPressed)) {
		send %sendChar%

		if (!(lastTimer == "")) {
			SetTimer, %lastTimer%, Off
		}


		lastPressed := char
		lastTimer := Func("sendAccent").bind(char, accentChar)
		SetTimer, %lastTimer%, -400
	}
}

handleHotkeyUp(key) {
	global lastPressed
	global lastTimer

	if (key == lastPressed) {
		SetTimer, %lastTimer%, Off
		lastPressed := ""
	}
}

sendAccent(char, accentChar) {
	global lastPressed

	if (char == lastPressed) {
		Send, {Backspace}%accentChar%
	}
}