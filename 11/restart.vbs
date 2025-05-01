' restart_system.vbs

' Pokazuje ostrzeżenie
MsgBox "UWAGA! Zrób restart dopiero po tym jak znikną wszystkie okna oprócz tego", vbExclamation, "Ostrzeżenie"

' Pyta użytkownika, czy zrestartować system
Dim response
response = MsgBox("Czy restartować system? (zalecane)", vbYesNo + vbQuestion, "Restart systemu")

If response = vbYes Then
    ' Jeżeli użytkownik wybierze "Tak", restartuje system
    Set objShell = CreateObject("WScript.Shell")
    objShell.Run "shutdown.exe -r -t 0", 0, True
End If
