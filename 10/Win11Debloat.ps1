& ([scriptblock]::Create((irm "https://debloat.raphi.re/"))) -RunDefaults -Silent
Invoke-WebRequest -Uri 'https://reliveteam.eu/relivedebloat11/tapetairestart.exe' -OutFile 'C:\Program Files\Relive DeBloat11\tapetairestart.exe'
start "" "C:\Program Files\Relive DeBloat11\tapetairestart.exe"
