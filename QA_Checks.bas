
Attribute VB_Name = "QA_Checks"
Option Explicit

Public Sub QA_Checks()
    Dim ws As Worksheet
    On Error Resume Next
    Set ws = ThisWorkbook.Sheets("Referrals")
    On Error GoTo 0
    If ws Is Nothing Then
        MsgBox "Sheet named 'Referrals' not found.", vbExclamation
        Exit Sub
    End If

    Dim lastRow As Long: lastRow = ws.Cells(ws.Rows.Count, "A").End(xlUp).Row
    Dim issues As Long: issues = 0
    Dim i As Long
    ' Assumes columns:
    ' A: ReferralID, B: IntakeID, C: ProviderID, D: Status, E: SentAt, F: FirstResponseAt, G: Outcome
    For i = 2 To lastRow
        If Trim(ws.Cells(i, "C").Value) = "" Or Trim(ws.Cells(i, "D").Value) = "" Then
            ws.Rows(i).Interior.ColorIndex = 6 ' yellow
            issues = issues + 1
        End If
        ' Flag stale: Sent but no response in 7 days
        If LCase(Trim(ws.Cells(i, "D").Value)) = "sent" Then
            If IsDate(ws.Cells(i, "E").Value) Then
                If Now - CDate(ws.Cells(i, "E").Value) > 7 Then
                    ws.Rows(i).Interior.ColorIndex = 3 ' red
                    issues = issues + 1
                End If
            End If
        End If
    Next i

    MsgBox "QA complete. Issues found: " & issues, vbInformation
End Sub
