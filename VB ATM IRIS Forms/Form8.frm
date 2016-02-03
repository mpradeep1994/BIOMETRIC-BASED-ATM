VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{6D7C9DDD-EBA0-4CEF-BFE4-F54FB0B59FBE}#1.0#0"; "TIrisMonoA.ocx"
Begin VB.Form Form8 
   Caption         =   "Form8"
   ClientHeight    =   9090
   ClientLeft      =   120
   ClientTop       =   450
   ClientWidth     =   14580
   LinkTopic       =   "Form8"
   ScaleHeight     =   9090
   ScaleWidth      =   14580
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text2 
      Height          =   195
      Left            =   0
      TabIndex        =   9
      Top             =   0
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Authenticate"
      Height          =   495
      Left            =   8040
      TabIndex        =   3
      Top             =   1320
      Width           =   3135
   End
   Begin VB.TextBox Text1 
      Height          =   525
      Left            =   3600
      TabIndex        =   1
      Top             =   1320
      Width           =   3855
   End
   Begin TIrisMonoA.IrisMonoA IrisDev 
      Height          =   6255
      Left            =   960
      TabIndex        =   0
      Top             =   2400
      Width           =   7815
      _ExtentX        =   13785
      _ExtentY        =   11033
   End
   Begin TIrisMonoA.IrisMonoA iK7 
      Height          =   3135
      Left            =   9480
      TabIndex        =   4
      Top             =   5520
      Width           =   4500
      _ExtentX        =   7938
      _ExtentY        =   5530
   End
   Begin TIrisMonoA.IrisMonoA iK3 
      Height          =   3135
      Left            =   9480
      TabIndex        =   5
      Top             =   2040
      Width           =   4425
      _ExtentX        =   7805
      _ExtentY        =   5530
   End
   Begin MSComctlLib.StatusBar StatB 
      Align           =   2  'Align Bottom
      Height          =   420
      Left            =   0
      TabIndex        =   10
      Top             =   8670
      Width           =   14580
      _ExtentX        =   25718
      _ExtentY        =   741
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.Label ente 
      Caption         =   "BIO-METRIC IRIS AUTHENTIFICATION "
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
      Left            =   1680
      TabIndex        =   8
      Top             =   360
      Width           =   8775
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "K3 image"
      Height          =   195
      Left            =   12960
      TabIndex        =   7
      Top             =   1680
      Width           =   840
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "K7 image"
      Height          =   195
      Left            =   13080
      TabIndex        =   6
      Top             =   5280
      Width           =   840
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
      Left            =   840
      TabIndex        =   2
      Top             =   1440
      Width           =   2295
   End
End
Attribute VB_Name = "Form8"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False



Public a As String
Public b As String
Public c As Integer

Public username As String
Public dbiris As String
 Public tsRet As String
 Dim tK3ImgB64 As String
    Dim tK7ImgB64 As String
Option Explicit

Dim nRet As Long
Dim sRet As String



Private Sub Form_Load()
Text1.Text = Form5.Text1.Text
 
 c = 0
Call Run_GetFeat
 
End Sub
Private Sub Run_GetFeat()
 
  Dim con As adodb.Connection
  Dim rs As adodb.Recordset
  Set con = New adodb.Connection
  Set rs = New adodb.Recordset
  con.Open "dsn=atm"
  'con.CursorLocation = AdUserclient
  a = Val(Text1.Text)
rs.Open "SELECT *FROM account WHERE atmcard = '" & Val(a) & "'", con
 
  If rs.EOF = False And rs.BOF = False Then
  'get stored iris feature
  Text2.Text = rs.Fields("iris")
  username = rs.Fields("name")
  dbiris = Text2.Text
  'MsgBox (dbiris)
  nRet = IrisDev.Teso_AddIrisFeaB64(a, 0, dbiris)
   If nRet >= 0 Then
        StatB.SimpleText = a & "user's iris feature is added to memory successfuly. The User's count is " & CStr(nRet) & "."
    Else
        StatB.SimpleText = a & "user's iris feature is added to memory failure. the error is " & CStr(nRet) & "."
    End If
  
  Else
  
  MsgBox "Record not found", vbCritical + vbOKOnly, "Error"
  
  End If
  
  rs.Close
  con.Close
  
  tsRet = IrisDev.Teso_GetIrisFeaB64(30)
    tK3ImgB64 = IrisDev.Teso_GetIrisImgB64([03_k3])
        Call iK3.Teso_ShowIrisImgB64(tK3ImgB64)
        
        ' Show K7 Image
        tK7ImgB64 = IrisDev.Teso_GetIrisImgB64([07_k7])
        Call iK7.Teso_ShowIrisImgB64(tK7ImgB64)
  If Len(tsRet) > 10 Then
        
        Call IrisDev.Teso_PlayHintSound(2)
        StatB.SimpleText = "Success to extract the iris feature"
        
  nRet = IrisDev.Teso_AddIrisFeaB64("", 0, tsRet)
      If nRet >= 0 Then
        StatB.SimpleText = a & "user's iris feature is added to memory successfuly. The User's count is " & CStr(nRet) & "."
    Else
        StatB.SimpleText = a & "user's iris feature is added to memory failure. the error is " & CStr(nRet) & "."
    End If
  End If
    
End Sub


Private Sub Command3_Click()

b = IrisDev.Teso_VerIrisFeaB64("", 0, tsRet, 3)

If (b = a) Then
 Call IrisDev.Teso_PlayHintSound(3)
 StatB.SimpleText = "Welcome " & username & "."

Dim msg As String
   msg = MsgBox("welcom " & username & ". Do you want to coninue?", vbYesNo, "Question")
   If msg = vbYes Then
  Form4.Show
Unload Me
End If
'If MsgBox("welcom " & username & ".", vbYesNo + vbDefaultButton1) = vbNo Then
'Form3.Show
'Unload Me


Else
If c = 2 Then
MsgBox ("account locked try again later")
Unload Me
Else
MsgBox ("iris not matching please try again")
Call Run_GetFeat
c = c + 1
End If
End If


End Sub

