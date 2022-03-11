Set objFSO = CreateObject("Scripting.FileSystemObject")

Main

Function Main()

Dim strPath : strPath = Wscript.ScriptFullName


Set objFile = objFSO.GetFile(strPath)
Dim strFolder : strFolder = objFSO.GetParentFolderName(objFile) 

Const appDataAppend = "\bin\resources\app\appData"

Dim usrName : usrName = InputBox("Which user?","User selection", "")
Dim desPath : desPath = strFolder & appDataAppend
Dim srcPath : srcPath = desPath & "_" & usrName

If IsEmpty(usrName) Then
   WScript.Quit
End If

' MsgBox("exist:" & objFSO.FolderExists(srcPath))
' MsgBox("len:" & (Len(usrName) > 0))

If Len(usrName) > 0 Then
   If objFSO.FolderExists(srcPath) Then
'      MsgBox(srcPath & " to " & desPath)
      Dim strTemp : strTemp = "Temp"
      CheckAndResolveAppData desPath, strTemp


      objFSO.MoveFolder srcPath, desPath
   Else
      Select Case MsgBox("Folder not found, shall I create a new profile?" & vbNewLine & "(Click No to launch the currently loaded profile, or cancel to quit)", 3)
        Case vbYes
             CheckAndResolveAppData desPath, usrName
        Case vbNo
        Case vbCancel
             Wscript.Quit
      End Select
   End If
End If


Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run strFolder & "\bin\Discord.exe"



End Function


Function CheckAndResolveAppData(desPath, defName)

      If objFSO.FolderExists(desPath) Then
         Dim rePath : rePath = desPath
         Dim reName
         While objFSO.FolderExists(rePath)
            reName = InputBox("An AppData folder already exists, what should I rename it to?","Folder Collision", defName)
            If IsEmpty(reName) Then
               WScript.Quit
            End If
            rePath = desPath & "_" & reName
         WEnd
         objFSO.MoveFolder desPath, rePath
      End If

End Function