VERSION 5.00
Begin VB.Form Form3 
   Caption         =   "Form3"
   ClientHeight    =   8445
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   13275
   LinkTopic       =   "Form3"
   ScaleHeight     =   8445
   ScaleWidth      =   13275
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text4 
      Height          =   495
      Left            =   9600
      TabIndex        =   21
      Top             =   5640
      Width           =   2775
   End
   Begin VB.TextBox Text3 
      Height          =   615
      Left            =   9600
      Locked          =   -1  'True
      TabIndex        =   19
      Top             =   3240
      Width           =   2655
   End
   Begin VB.CommandButton Command11 
      Caption         =   "SEND OTP "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   9600
      TabIndex        =   18
      Top             =   4080
      Width           =   2415
   End
   Begin VB.TextBox Text2 
      Height          =   375
      Left            =   5160
      Locked          =   -1  'True
      TabIndex        =   16
      Top             =   1440
      Width           =   2775
   End
   Begin VB.TextBox Text1 
      Height          =   615
      IMEMode         =   3  'DISABLE
      Left            =   5280
      PasswordChar    =   "*"
      TabIndex        =   15
      Top             =   2400
      Width           =   2775
   End
   Begin VB.CommandButton Command12 
      Caption         =   "clr"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   1
      Left            =   6600
      TabIndex        =   12
      Top             =   6600
      Width           =   1575
   End
   Begin VB.CommandButton Command10 
      Caption         =   "0"
      Height          =   855
      Index           =   0
      Left            =   5040
      TabIndex        =   11
      Top             =   6600
      Width           =   855
   End
   Begin VB.CommandButton Command3 
      Caption         =   "3"
      Height          =   855
      Index           =   9
      Left            =   7440
      TabIndex        =   10
      Top             =   3240
      Width           =   855
   End
   Begin VB.CommandButton Command4 
      Caption         =   "4"
      Height          =   855
      Index           =   8
      Left            =   5040
      TabIndex        =   9
      Top             =   4320
      Width           =   855
   End
   Begin VB.CommandButton Command5 
      Caption         =   "5"
      Height          =   855
      Index           =   7
      Left            =   6240
      TabIndex        =   8
      Top             =   4320
      Width           =   855
   End
   Begin VB.CommandButton Command6 
      Caption         =   "6"
      Height          =   855
      Index           =   6
      Left            =   7440
      TabIndex        =   7
      Top             =   4320
      Width           =   855
   End
   Begin VB.CommandButton Command7 
      Caption         =   "7"
      Height          =   855
      Index           =   5
      Left            =   5040
      TabIndex        =   6
      Top             =   5400
      Width           =   855
   End
   Begin VB.CommandButton Command8 
      Caption         =   "8"
      Height          =   855
      Index           =   4
      Left            =   6240
      TabIndex        =   5
      Top             =   5400
      Width           =   855
   End
   Begin VB.CommandButton Command9 
      Caption         =   "9"
      Height          =   855
      Index           =   3
      Left            =   7440
      TabIndex        =   4
      Top             =   5400
      Width           =   855
   End
   Begin VB.CommandButton Command2 
      Caption         =   "2"
      Height          =   855
      Index           =   1
      Left            =   6240
      TabIndex        =   3
      Top             =   3240
      Width           =   855
   End
   Begin VB.CommandButton Command15 
      Caption         =   "1"
      Height          =   855
      Index           =   0
      Left            =   5040
      TabIndex        =   2
      Top             =   3240
      Width           =   855
   End
   Begin VB.CommandButton Command1 
      Caption         =   "LOGIN"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   9720
      TabIndex        =   1
      Top             =   6600
      Width           =   2055
   End
   Begin VB.Label Label2 
      Caption         =   "   ATM CARD PIN VERIFICATION"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Index           =   2
      Left            =   1440
      TabIndex        =   25
      Top             =   3840
      Width           =   3015
   End
   Begin VB.Label Label4 
      Caption         =   "STEP 2"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   1
      Left            =   10320
      TabIndex        =   24
      Top             =   720
      Width           =   1935
   End
   Begin VB.Label Label4 
      Caption         =   "STEP 1 :"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   0
      Left            =   0
      TabIndex        =   23
      Top             =   3840
      Width           =   1935
   End
   Begin VB.Line Line1 
      Index           =   3
      X1              =   9000
      X2              =   4800
      Y1              =   7800
      Y2              =   7800
   End
   Begin VB.Line Line1 
      Index           =   2
      X1              =   9000
      X2              =   4800
      Y1              =   1200
      Y2              =   1200
   End
   Begin VB.Line Line1 
      Index           =   1
      X1              =   4800
      X2              =   4800
      Y1              =   1200
      Y2              =   7800
   End
   Begin VB.Label Label2 
      Caption         =   "Enter  OTP sent to your mobile    "
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Index           =   1
      Left            =   9840
      TabIndex        =   22
      Top             =   5040
      Width           =   3015
   End
   Begin VB.Label Label3 
      Caption         =   "Mobile number"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   9840
      TabIndex        =   20
      Top             =   2640
      Width           =   1815
   End
   Begin VB.Label Label2 
      Caption         =   "     OTP  VERIFICATION            ( only to your registered mobile)"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Index           =   0
      Left            =   9600
      TabIndex        =   17
      Top             =   1320
      Width           =   3015
   End
   Begin VB.Line Line1 
      Index           =   0
      X1              =   9000
      X2              =   9000
      Y1              =   1200
      Y2              =   7800
   End
   Begin VB.Label Label1 
      Caption         =   "PIN"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Index           =   1
      Left            =   2880
      TabIndex        =   14
      Top             =   2520
      Width           =   1695
   End
   Begin VB.Label ente 
      Caption         =   "ENTER THE ACCOUNT DETAILS"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   2520
      TabIndex        =   13
      Top             =   360
      Width           =   6255
   End
   Begin VB.Label Label1 
      Caption         =   "ACCOUNT NO:"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Index           =   0
      Left            =   2880
      TabIndex        =   0
      Top             =   1320
      Width           =   1935
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Public ranpin As Integer


Private Sub Command1_Click()
Dim aa As Long
Dim bb As Long

'aa = Val(Text2.Text)
'bb = Val(Text1.Text)

    Dim conn As adodb.Connection
    Dim rs As adodb.Recordset
    Dim sql As String
   
    Set conn = New adodb.Connection
    conn.Open "dsn=atm"
         ' Look up the user name/password.
    statement = "SELECT COUNT (*) FROM account WHERE " & _
          "atmcard='" & Replace(Val(Text2.Text), "'", "''") & "' AND " & _
          "atmpin='" & Replace(Val(Text1.Text), "'", "''") & "'"
      Set rs = conn.Execute(statement)

      ' See for  anything.
      If CLng(rs.Fields(0)) < 1 Then
          ' There is no match.
          MsgBox "Invalid accnt no /password."
          
      Else
      If Text4.Text <> ranpin Then
         MsgBox "Invalid OTP"
       
      Else
         ' There is a match.
 
         Form8.Show
      Unload Me
     End If
     End If
    rs.Close

    conn.Close

End Sub

Private Sub Command10_Click(Index As Integer)
Text1.Text = Text1.Text + "0"
End Sub

Private Sub Command11_Click()
   


    
    Dim txtSMSDeveloperAPI As String
    Dim mymob As String
    Dim mymsg As String
    Dim state As String
    Dim l1 As String
    Dim l2 As String
    txtSMSDeveloperAPI = "http://api.mVaayoo.com/mvaayooapi/MessageCompose?user=Kirthi.raghu00@gmail.com:Monitor009&senderID=TEST SMS"
    l1 = "&receipientno="
    mymob = Text3.Text
    l2 = "&dcs=0&msgtxt=HERE IS YOUR OTP "
    mymsg = ranpin
    state = "&state=4"
    Me.MousePointer = 11 'Hourglass
    Call SendMySMS(Trim(txtSMSDeveloperAPI), l1, mymob, l2, mymsg, Trim(state))
    Me.MousePointer = 0 'Default

End Sub


Public Sub SendMySMS(Optional ByVal UserDeveloperAPI As String = "", Optional ByVal l1 As String = "", Optional ByVal mymob As String, Optional ByVal l2 As String = "", Optional ByVal mymsg As String, Optional ByVal state As String = "")
    
    On Error GoTo Err
    
    Dim sResult As String, strURL As String
    strURL = ""
    strURL = UserDeveloperAPI & l1 & mymob & l2 & mymsg & state
   
        
       'If MsgBox("Do you want to send SMS?", vbYesNo + vbDefaultButton1) = vbNo Then
                  
         If MsgBox(strURL, vbYesNo + vbDefaultButton1) = vbNo Then
                  
            Exit Sub
            
        End If
    GoTo UseFullAPI
        
UseFullAPI:

    Dim WinHttpReq As Object
    Set WinHttpReq = CreateObject("Msxml2.XMLHTTP")
   
    With WinHttpReq
          .Open "GET", strURL, False
        .Send
        sResult = .responseText
    End With
    If ShowStatus Then MsgBox "Status of Sent SMS  is=" & sResult
     
    Exit Sub
Err:
    MsgBox ("Sorry there is some error while sending sms" & vbCrLf & Err.Description)
    Me.MousePointer = 0 'Default
End Sub



Private Sub Command12_Click(Index As Integer)
If Len(Text1.Text) = 0 Then Exit Sub


Text1.Text = Mid(Text1.Text, 1, Len(Text1.Text) - 1)

End Sub

Private Sub Command15_Click(Index As Integer)
Text1.Text = Text1.Text + "1"
End Sub

Private Sub Command2_Click(Index As Integer)
Text1.Text = Text1.Text + "2"
End Sub

Private Sub Command3_Click(Index As Integer)
Text1.Text = Text1.Text + "3"
End Sub

Private Sub Command4_Click(Index As Integer)
Text1.Text = Text1.Text + "4"
End Sub

Private Sub Command5_Click(Index As Integer)
Text1.Text = Text1.Text + "5"
End Sub

Private Sub Command6_Click(Index As Integer)
Text1.Text = Text1.Text + "6"
End Sub

Private Sub Command7_Click(Index As Integer)
Text1.Text = Text1.Text + "7"
End Sub

Private Sub Command8_Click(Index As Integer)
Text1.Text = Text1.Text + "8"
End Sub

Private Sub Command9_Click(Index As Integer)
Text1.Text = Text1.Text + "9"
End Sub


Private Sub Form_Load()
   Randomize

ranpin = Round(CStr(10000 * Rnd()))
Text2.Text = Trim(Form5.Text1.Text)

Dim con As adodb.Connection
Dim rs As adodb.Recordset
Set con = New adodb.Connection
Set rs = New adodb.Recordset
 con.Open "dsn=atm"
'con.CursorLocation = AdUserclient
   
  rs.Open "SELECT *FROM account WHERE atmcard = '" & Val(Text2.Text) & "'", con
  
  
   If rs.EOF = False And rs.BOF = False Then

  Text3.Text = rs.Fields("phno")
  Else
MsgBox "Record not found", vbCritical + vbOKOnly, "Error"
End If
rs.Close
con.Close

End Sub


