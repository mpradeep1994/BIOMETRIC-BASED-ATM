VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form Form5 
   Caption         =   "Form5"
   ClientHeight    =   8685
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   13005
   LinkTopic       =   "Form5"
   ScaleHeight     =   8685
   ScaleWidth      =   13005
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      Height          =   195
      Left            =   0
      TabIndex        =   3
      Top             =   120
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.CommandButton Command1 
      Caption         =   "GO"
      Height          =   615
      Left            =   7680
      Picture         =   "Form5.frx":0000
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   2400
      Width           =   3015
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
      Height          =   735
      Left            =   3000
      TabIndex        =   0
      Top             =   2280
      Width           =   4095
   End
   Begin MSComctlLib.StatusBar StatB 
      Align           =   2  'Align Bottom
      Height          =   420
      Left            =   0
      TabIndex        =   2
      Top             =   8265
      Width           =   13005
      _ExtentX        =   22939
      _ExtentY        =   741
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
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
      Left            =   2640
      TabIndex        =   5
      Top             =   480
      Width           =   6735
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
      Left            =   360
      TabIndex        =   4
      Top             =   2400
      Width           =   2295
   End
   Begin VB.Image Image2 
      DragMode        =   1  'Automatic
      Height          =   3900
      Left            =   600
      Picture         =   "Form5.frx":6BC9
      Stretch         =   -1  'True
      Top             =   3720
      Width           =   6075
   End
   Begin VB.Image Image1 
      Height          =   3840
      Left            =   7560
      Picture         =   "Form5.frx":56617
      Top             =   3840
      Width           =   4875
   End
End
Attribute VB_Name = "Form5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Public a As String

Private Sub Command1_Click()
 
  Dim con As adodb.Connection
  Dim rs As adodb.Recordset
  Set con = New adodb.Connection
  Set rs = New adodb.Recordset
  con.Open "dsn=atm"
  'con.CursorLocation = AdUserclient
  a = Val(Text1.Text)
rs.Open "SELECT *FROM account WHERE atmcard = '" & Val(a) & "'", con
 
  If rs.EOF = False And rs.BOF = False Then
  
  Me.Hide
  
  Form3.Show
  
  Else
  
  MsgBox "Record not found", vbCritical + vbOKOnly, "Error"
  
  End If
  
  rs.Close
  con.Close
      
End Sub



