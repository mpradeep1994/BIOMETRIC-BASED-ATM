VERSION 5.00
Begin VB.Form Form7 
   Caption         =   "Form7"
   ClientHeight    =   8865
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   13830
   LinkTopic       =   "Form7"
   ScaleHeight     =   8865
   ScaleWidth      =   13830
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command5 
      Caption         =   "Ok"
      Height          =   975
      Left            =   5040
      TabIndex        =   11
      Top             =   6000
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Height          =   735
      Left            =   4680
      TabIndex        =   10
      Top             =   4800
      Width           =   2415
   End
   Begin VB.CommandButton Command4 
      Caption         =   "EXIT"
      BeginProperty Font 
         Name            =   "Palatino Linotype"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Index           =   3
      Left            =   9840
      MaskColor       =   &H00404040&
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   4800
      Width           =   2415
   End
   Begin VB.CommandButton Command3 
      Caption         =   "CASH WITHDRAW"
      BeginProperty Font 
         Name            =   "Palatino Linotype"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Index           =   2
      Left            =   9840
      MaskColor       =   &H00404040&
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   2880
      Width           =   2415
   End
   Begin VB.CommandButton Command2 
      Caption         =   "BALANCE CHECK"
      BeginProperty Font 
         Name            =   "Palatino Linotype"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Index           =   1
      Left            =   240
      MaskColor       =   &H00404040&
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   4680
      Width           =   1935
   End
   Begin VB.CommandButton Command1 
      Caption         =   "USER DETAILS"
      BeginProperty Font 
         Name            =   "Palatino Linotype"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   -1  'True
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1215
      Index           =   0
      Left            =   240
      MaskColor       =   &H00404040&
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   2760
      Width           =   1935
   End
   Begin VB.Label Label5 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   8520
      TabIndex        =   9
      Top             =   1560
      Width           =   3015
   End
   Begin VB.Label Label4 
      Caption         =   "ACCOUNT NO :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   5760
      TabIndex        =   8
      Top             =   1560
      Width           =   2295
   End
   Begin VB.Label Label3 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   2280
      TabIndex        =   7
      Top             =   1440
      Width           =   2775
   End
   Begin VB.Label Label2 
      Caption         =   "WELCOME :"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   0
      TabIndex        =   6
      Top             =   1440
      Width           =   2055
   End
   Begin VB.Label Label1 
      Caption         =   "WELCOME TO THE ATM"
      BeginProperty Font 
         Name            =   "Rockwell Extra Bold"
         Size            =   24
         Charset         =   0
         Weight          =   800
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   2880
      TabIndex        =   5
      Top             =   0
      Width           =   6735
   End
   Begin VB.Label Label6 
      Caption         =   "ENTER THE AMOUNT "
      BeginProperty Font 
         Name            =   "Poor Richard"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   975
      Left            =   3840
      TabIndex        =   4
      Top             =   3360
      Width           =   4695
   End
End
Attribute VB_Name = "Form7"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public amt1 As Integer

Public amt2 As Integer

Private Sub Command1_Click(Index As Integer)
Form4.Show
Unload Me
End Sub

Private Sub Command2_Click(Index As Integer)
Form6.Show
Unload Me
End Sub

Private Sub Command4_Click(Index As Integer)
Unload Me
End Sub



Private Sub Command5_Click()
Dim dbamt As Integer

amt2 = Text1.Text
dbamt = Val(Val(amt1) - Val(amt2))

Dim con As adodb.Connection
Dim rs As adodb.Recordset
Set con = New adodb.Connection
Set rs = New adodb.Recordset
 con.Open "dsn=atm"
'con.CursorLocation = AdUserclient
   Dim stSQL As String
 
stSQL = "UPDATE  account set amount=" & Val(dbamt) & " WHERE atmcard = '" & Label5(1).Caption & "'"
  
con.Execute stSQL
MsgBox ("Dont Forget To collect your cash!! your new balance is " & dbamt)
End Sub

Private Sub Form_Load()

Dim var As String
var = Form1.Label5(1).Caption
If var = "" Then
var = Form4.Label5(1).Caption
ElseIf var = "" Then
var = Form6.Label5(1).Caption
End If

Label5(1).Caption = var



Dim con As adodb.Connection
Dim rs As adodb.Recordset
Set con = New adodb.Connection
Set rs = New adodb.Recordset
 con.Open "dsn=atm"
'con.CursorLocation = AdUserclient
   
  rs.Open "SELECT *FROM account WHERE atmcard = '" & Label5(1).Caption & "'", con
  
  
   If rs.EOF = False And rs.BOF = False Then

  Label3(0).Caption = rs.Fields("name")
amt1 = rs.Fields("amount")

  Else
MsgBox "Record not found", vbCritical + vbOKOnly, "Error"
End If

End Sub

