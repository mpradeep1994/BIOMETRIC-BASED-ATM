VERSION 5.00
Begin VB.Form Form6 
   Caption         =   "Form6"
   ClientHeight    =   8805
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   13335
   LinkTopic       =   "Form6"
   ScaleHeight     =   8805
   ScaleWidth      =   13335
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   24
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   1095
      Left            =   6000
      TabIndex        =   9
      Top             =   4440
      Width           =   3135
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
      Left            =   480
      MaskColor       =   &H00404040&
      Style           =   1  'Graphical
      TabIndex        =   3
      Top             =   3360
      Width           =   1935
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
      Left            =   480
      MaskColor       =   &H00404040&
      Style           =   1  'Graphical
      TabIndex        =   2
      Top             =   5280
      Width           =   1935
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
      Left            =   10080
      MaskColor       =   &H00404040&
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   3480
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
      Left            =   10080
      MaskColor       =   &H00404040&
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   5400
      Width           =   2415
   End
   Begin VB.Label Label6 
      Caption         =   "BALANCE "
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
      Left            =   2880
      TabIndex        =   10
      Top             =   4680
      Width           =   3015
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
      Left            =   3120
      TabIndex        =   8
      Top             =   600
      Width           =   6735
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
      Left            =   240
      TabIndex        =   7
      Top             =   2040
      Width           =   2055
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
      Left            =   2520
      TabIndex        =   6
      Top             =   2040
      Width           =   2775
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
      Left            =   6000
      TabIndex        =   5
      Top             =   2160
      Width           =   2295
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
      Left            =   8760
      TabIndex        =   4
      Top             =   2160
      Width           =   3015
   End
End
Attribute VB_Name = "Form6"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Command1_Click(Index As Integer)
Form4.Show
Unload Me
End Sub



Private Sub Command3_Click(Index As Integer)
Form7.Show
Unload Me

End Sub

Private Sub Command4_Click(Index As Integer)
Unload Me
End Sub

Private Sub Form_Load()

Dim var As String
var = Form1.Label5(1).Caption
If var = "" Then
var = Form4.Label5(1).Caption
ElseIf var = "" Then
var = Form7.Label5(1).Caption

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
  'Label3.Caption = n1.Text
  Text2.Text = rs.Fields("amount")
  Else
MsgBox "Record not found", vbCritical + vbOKOnly, "Error"
End If

End Sub


