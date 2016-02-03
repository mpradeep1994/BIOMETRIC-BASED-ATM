VERSION 5.00
Begin VB.Form Form4 
   Caption         =   "Form4"
   ClientHeight    =   8595
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   14940
   LinkTopic       =   "Form4"
   ScaleHeight     =   8595
   ScaleWidth      =   14940
   StartUpPosition =   3  'Windows Default
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
      Left            =   720
      MaskColor       =   &H00404040&
      Style           =   1  'Graphical
      TabIndex        =   19
      Top             =   3120
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
      Left            =   720
      MaskColor       =   &H00404040&
      Style           =   1  'Graphical
      TabIndex        =   18
      Top             =   5040
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
      Left            =   10800
      MaskColor       =   &H00404040&
      Style           =   1  'Graphical
      TabIndex        =   17
      Top             =   3240
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
      Left            =   10800
      MaskColor       =   &H00404040&
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   5160
      Width           =   2415
   End
   Begin VB.TextBox Text5 
      Height          =   495
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   6
      Top             =   6240
      Width           =   3615
   End
   Begin VB.TextBox Text4 
      Height          =   495
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   5
      Top             =   5400
      Width           =   3615
   End
   Begin VB.TextBox Text3 
      Height          =   495
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   4
      Top             =   4560
      Width           =   3615
   End
   Begin VB.TextBox Text2 
      Height          =   615
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   3
      Top             =   3720
      Width           =   3615
   End
   Begin VB.TextBox Text1 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   6120
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   2880
      Width           =   3615
   End
   Begin VB.Line Line1 
      Index           =   1
      X1              =   2880
      X2              =   2880
      Y1              =   3000
      Y2              =   6480
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
      Left            =   10440
      TabIndex        =   15
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
      Left            =   7800
      TabIndex        =   14
      Top             =   1440
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
      Index           =   4
      Left            =   2760
      TabIndex        =   13
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
      Left            =   360
      TabIndex        =   12
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
      Index           =   1
      Left            =   3480
      TabIndex        =   11
      Top             =   240
      Width           =   6735
   End
   Begin VB.Line Line1 
      Index           =   0
      X1              =   10440
      X2              =   10440
      Y1              =   3000
      Y2              =   6480
   End
   Begin VB.Label Label3 
      Caption         =   "Phone Number"
      Height          =   615
      Index           =   3
      Left            =   3480
      TabIndex        =   10
      Top             =   6240
      Width           =   2415
   End
   Begin VB.Label Label3 
      Caption         =   "mail ID"
      Height          =   615
      Index           =   2
      Left            =   3480
      TabIndex        =   9
      Top             =   5520
      Width           =   2415
   End
   Begin VB.Label Label3 
      Caption         =   "address"
      Height          =   615
      Index           =   1
      Left            =   3480
      TabIndex        =   8
      Top             =   4800
      Width           =   2415
   End
   Begin VB.Label Label3 
      Caption         =   "Name"
      Height          =   735
      Index           =   0
      Left            =   3480
      TabIndex        =   7
      Top             =   3960
      Width           =   2415
   End
   Begin VB.Label Label2 
      Caption         =   "your account Number"
      Height          =   615
      Index           =   1
      Left            =   3480
      TabIndex        =   2
      Top             =   3120
      Width           =   2415
   End
   Begin VB.Label Label1 
      Caption         =   "USER DETAILS"
      BeginProperty Font 
         Name            =   "MS Serif"
         Size            =   24
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Index           =   0
      Left            =   4560
      TabIndex        =   0
      Top             =   2040
      Width           =   3735
   End
End
Attribute VB_Name = "Form4"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

 
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
Dim var As String

var = Form3.Text2.Text
If var = "" Then
var = Form6.Label5(1).Caption
ElseIf var = "" Then
var = Form7.Label5(1).Caption
End If
Text1.Text = var
Label5(1).Caption = var


Dim con As adodb.Connection
Dim rs As adodb.Recordset
Set con = New adodb.Connection
Set rs = New adodb.Recordset
 con.Open "dsn=atm"
'con.CursorLocation = AdUserclient
   
  rs.Open "SELECT *FROM account WHERE atmcard = '" & Val(Text1.Text) & "'", con
  
  
   If rs.EOF = False And rs.BOF = False Then
Text2.Text = rs.Fields("name")
Text3.Text = rs.Fields("addrs")
Text4.Text = rs.Fields("mailid")
Text5.Text = rs.Fields("phno")
  
  Label3(4).Caption = rs.Fields("name")
  Else
MsgBox "Record not found", vbCritical + vbOKOnly, "Error"
End If
  
  End Sub





