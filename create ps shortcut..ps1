(GCI | Where-Object {$_.Extension -eq ".ps1"}).Name | ForEach-Object {
    $WshShell = New-Object -ComObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut((GL).Path+"\$_ Run.lnk")
    $Shortcut.TargetPath = 'CMD'
    $Shortcut.Arguments = "/C PowerShell `"SL -PSPath `'%CD%`'; `$Path = (GL).Path; SL ~; Start PowerShell -Verb RunAs -Args \`"`"SL -PSPath `'`"`$Path`"`'; & `'`".\$_`"`'`"\`"`""    
    $Shortcut.IconLocation = 'PowerShell.exe'
    $Shortcut.Save()
}