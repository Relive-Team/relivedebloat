' restart_system.vbs
Dim response
response = MsgBox("Instalacja zostala zakonczona. Czy restartowac system? (zalecane)", vbYesNo + vbQuestion, "Restart systemu")

If response = vbYes Then
    ' JeĹ›li uĹĽytkownik wybierze "Tak", restartuje system
    Set objShell = CreateObject("WScript.Shell")
    objShell.Run "shutdown.exe -r -t 0", 0, True
End If
