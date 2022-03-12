Option Explicit

Const electronBinFolder = "\bin\"
Const electronBinaryApp = "Discord.exe"

Dim objShell, objFSO
Set objShell = WScript.CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")
Call Main()


Sub Main()
   Dim strPath, strFolder, appDataAppend
   Dim usrName, desPath, srcPath
   
   strPath = Wscript.ScriptFullName
   strFolder = objFSO.GetParentFolderName(objFSO.GetFile(strPath)) 
   appDataAppend = electronBinFolder & "resources\app\appData"

   usrName = InputBox("Which user?","User selection", "")
   desPath = strFolder & appDataAppend
   srcPath = desPath & "_" & usrName

   If IsEmpty(usrName) Then
      WScript.Quit
   End If

   ' MsgBox("exist:" & objFSO.FolderExists(srcPath))
   ' MsgBox("len:" & (Len(usrName) > 0))

   If Len(usrName) > 0 Then
      If objFSO.FolderExists(srcPath) Then
   '      MsgBox(srcPath & " to " & desPath)
         Call CheckAndResolveAppData(desPath, "Temp")
         Call objFSO.MoveFolder(srcPath, desPath)
      Else
         Select Case MsgBox("Folder not found, shall I create a new profile?" & vbNewLine & "(Click No to launch the currently loaded profile, or cancel to quit)", 3)
         Case vbYes
               Call CheckAndResolveAppData(desPath, usrName)
         Case vbNo
         Case vbCancel
               Wscript.Quit
         End Select
      End If
   End If

   Call objShell.Run(strFolder & electronBinFolder & electronBinaryApp)

End Sub


Sub CheckAndResolveAppData(desPath, defName)
   If objFSO.FolderExists(desPath) Then
      Dim reName, rePath : rePath = desPath
      While objFSO.FolderExists(rePath)
         reName = InputBox("An AppData folder already exists, what should I rename it to?","Folder Collision", defName)
         If IsEmpty(reName) Then
            WScript.Quit
         End If
         rePath = desPath & "_" & reName
      WEnd
      Call objFSO.MoveFolder(desPath, rePath)
   End If
End Sub
