' restart_system.vbs

' Pokazuje ostrzeżenie
MsgBox "UWAGA! Zrob restart dopiero po tym jak znikna wszystkie okna oprocz tego", vbExclamation, "Ostrzeżenie"

' Pyta użytkownika, czy zrestartowac system
Dim response
response = MsgBox("Czy restartowac system? (zalecane)", vbYesNo + vbQuestion, "Restart systemu")

If response = vbYes Then
    ' Jeżeli użytkownik wybierze "Tak", restartuje system
    Set objShell = CreateObject("WScript.Shell")
    objShell.Run "shutdown.exe -r -t 0", 0, True
End If
