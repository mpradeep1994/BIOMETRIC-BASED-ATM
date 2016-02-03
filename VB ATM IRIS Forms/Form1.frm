VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   8715
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   12540
   LinkTopic       =   "Form1"
   ScaleHeight     =   8715
   ScaleWidth      =   12540
   StartUpPosition =   3  'Windows Default
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
      TabIndex        =   6
      Top             =   5280
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
      TabIndex        =   5
      Top             =   3360
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
      TabIndex        =   4
      Top             =   5160
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
      TabIndex        =   3
      Top             =   3240
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
      Left            =   8160
      TabIndex        =   8
      Top             =   2040
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
      Left            =   5520
      TabIndex        =   7
      Top             =   2040
      Width           =   2295
   End
   Begin VB.Image Image1 
      Height          =   3840
      Left            =   3600
      Picture         =   "Form1.frx":0000
      Top             =   3000
      Width           =   4875
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
      TabIndex        =   2
      Top             =   1920
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
      Left            =   240
      TabIndex        =   1
      Top             =   1920
      Width           =   2295
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
      TabIndex        =   0
      Top             =   480
      Width           =   6735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Command1_Click(Index As Integer)
Form4.Show
Unload Me
End Sub



Private Sub Command2_Click(Index As Integer)
Form6.Show
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

Label5(1).Caption = Form3.Text2.Text

Dim con As adodb.Connection
Dim rs As adodb.Recordset
Set con = New adodb.Connection
Set rs = New adodb.Recordset
 con.Open "dsn=atm"
'con.CursorLocation = AdUserclient
   
  rs.Open "SELECT *FROM account WHERE atmcard = '" & Form3.Text2.Text & "'", con
  
  
   If rs.EOF = False And rs.BOF = False Then

  Label3(0).Caption = rs.Fields("name")
  'Label3.Caption = n1.Text
  Else
MsgBox "Record not found", vbCritical + vbOKOnly, "Error"
End If

End Sub

