# Ustaw tytuł okna konsoli
$Host.UI.RawUI.WindowTitle = "ReliveDebloat10 - Instalacja Chrome"

# Wyświetl komunikaty
Write-Host "Opcja Chrome jest tymczasowo niedostępna."
Write-Host "Kliknij dowolny klawisz, aby zamknąć komunikat..."

# Pauza – czekaj na naciśnięcie klawisza
[void][System.Console]::ReadKey($true)
