VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{6D7C9DDD-EBA0-4CEF-BFE4-F54FB0B59FBE}#1.0#0"; "TIrisMonoA.ocx"
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form2 
   Caption         =   "Form2"
   ClientHeight    =   10170
   ClientLeft      =   225
   ClientTop       =   555
   ClientWidth     =   15120
   LinkTopic       =   "Form2"
   ScaleHeight     =   10170
   ScaleWidth      =   15120
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command4 
      Caption         =   "save IRIS"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   12120
      TabIndex        =   25
      Top             =   8880
      Width           =   2415
   End
   Begin VB.TextBox atmno 
      Height          =   285
      Left            =   3720
      TabIndex        =   19
      Top             =   7680
      Width           =   3615
   End
   Begin VB.TextBox atmpin 
      Height          =   285
      IMEMode         =   3  'DISABLE
      Left            =   3720
      PasswordChar    =   "*"
      TabIndex        =   18
      Top             =   8400
      Width           =   3735
   End
   Begin MSAdodcLib.Adodc Adodc2 
      Height          =   330
      Left            =   -600
      Top             =   0
      Visible         =   0   'False
      Width           =   1200
      _ExtentX        =   2117
      _ExtentY        =   582
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   2
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   0
      ConnectStringType=   1
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "Provider=MSDASQL.1;Persist Security Info=False;Data Source=atm"
      OLEDBString     =   "Provider=MSDASQL.1;Persist Security Info=False;Data Source=atm"
      OLEDBFile       =   ""
      DataSourceName  =   ""
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "Account"
      Caption         =   "Adodc1"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin VB.TextBox phn 
      DataField       =   "Phno"
      DataSource      =   "Adodc2"
      Height          =   405
      Left            =   3840
      TabIndex        =   15
      Top             =   5520
      Width           =   3735
   End
   Begin VB.TextBox state 
      DataField       =   "State"
      DataSource      =   "Adodc2"
      Height          =   405
      Left            =   3840
      TabIndex        =   14
      Top             =   4800
      Width           =   3735
   End
   Begin VB.TextBox dob 
      DataField       =   "DOB"
      DataSource      =   "Adodc2"
      Height          =   375
      Left            =   6360
      TabIndex        =   12
      Top             =   1920
      Width           =   1335
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Generate pin %% Acc NO %% send sms"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   3960
      TabIndex        =   10
      Top             =   6480
      Width           =   3375
   End
   Begin VB.CommandButton Command2 
      Caption         =   "REGISTER"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   4680
      TabIndex        =   9
      Top             =   8880
      Width           =   2535
   End
   Begin VB.CommandButton Command1 
      Caption         =   "scan IRIS"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   13.5
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   8520
      TabIndex        =   8
      Top             =   8880
      Width           =   2415
   End
   Begin VB.TextBox addrs 
      DataField       =   "Addrs"
      DataSource      =   "Adodc2"
      Height          =   1095
      Left            =   3840
      TabIndex        =   7
      Top             =   3360
      Width           =   3735
   End
   Begin VB.TextBox mailid 
      DataField       =   "MailID"
      DataSource      =   "Adodc2"
      Height          =   405
      Left            =   3840
      TabIndex        =   5
      Top             =   2640
      Width           =   3735
   End
   Begin VB.TextBox gender 
      DataField       =   "Gender"
      DataSource      =   "Adodc2"
      Height          =   375
      Left            =   3840
      TabIndex        =   3
      Top             =   1920
      Width           =   1335
   End
   Begin VB.TextBox username 
      DataField       =   "Name"
      DataSource      =   "Adodc2"
      Height          =   375
      Left            =   3960
      TabIndex        =   0
      Top             =   1080
      Width           =   3615
   End
   Begin TIrisMonoA.IrisMonoA IrisDev 
      Height          =   4680
      Left            =   9600
      TabIndex        =   21
      Top             =   3720
      Width           =   6240
      _ExtentX        =   11007
      _ExtentY        =   8255
   End
   Begin TIrisMonoA.IrisMonoA iK7 
      Height          =   2535
      Left            =   12840
      TabIndex        =   22
      Top             =   1080
      Width           =   3060
      _ExtentX        =   5398
      _ExtentY        =   4471
   End
   Begin TIrisMonoA.IrisMonoA iK3 
      Height          =   2535
      Left            =   9600
      TabIndex        =   23
      Top             =   1080
      Width           =   2820
      _ExtentX        =   4974
      _ExtentY        =   4471
   End
   Begin MSComctlLib.StatusBar StatB 
      Align           =   2  'Align Bottom
      Height          =   420
      Left            =   0
      TabIndex        =   24
      Top             =   9750
      Width           =   15120
      _ExtentX        =   26670
      _ExtentY        =   741
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.Label Label5 
      Caption         =   "IRIS DETAILS"
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
      Left            =   11160
      TabIndex        =   28
      Top             =   480
      Width           =   3735
   End
   Begin VB.Label Label4 
      Caption         =   "TRX BANK ATM  REGISTRATION"
      BeginProperty Font 
         Name            =   "Poor Richard"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   2520
      TabIndex        =   27
      Top             =   120
      Width           =   5775
   End
   Begin VB.Label Label3 
      Caption         =   "(Pin will be Generated and sent as sms for the given number for mobile verification)"
      Height          =   855
      Left            =   600
      TabIndex        =   26
      Top             =   6360
      Width           =   2655
   End
   Begin VB.Line Line4 
      X1              =   16200
      X2              =   16200
      Y1              =   8520
      Y2              =   960
   End
   Begin VB.Line Line3 
      X1              =   9240
      X2              =   16200
      Y1              =   960
      Y2              =   960
   End
   Begin VB.Line Line2 
      X1              =   9240
      X2              =   9240
      Y1              =   8520
      Y2              =   960
   End
   Begin VB.Line Line1 
      X1              =   16200
      X2              =   9240
      Y1              =   8520
      Y2              =   8520
   End
   Begin VB.Label Label2 
      Caption         =   "Card NO"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2160
      TabIndex        =   20
      Top             =   7560
      Width           =   1095
   End
   Begin VB.Label piinl 
      Caption         =   "ATM PIN"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   2040
      TabIndex        =   17
      Top             =   8520
      Width           =   1215
   End
   Begin VB.Label piinl 
      Caption         =   "Phone Number"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   1560
      TabIndex        =   16
      Top             =   5640
      Width           =   2175
   End
   Begin VB.Label statelabel 
      Caption         =   "State"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   1
      Left            =   2640
      TabIndex        =   13
      Top             =   4920
      Width           =   855
   End
   Begin VB.Label name 
      Caption         =   "DOB"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   2
      Left            =   5400
      TabIndex        =   11
      Top             =   1920
      Width           =   855
   End
   Begin VB.Label addddrs 
      Caption         =   "Address"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Index           =   0
      Left            =   2400
      TabIndex        =   6
      Top             =   3600
      Width           =   1095
   End
   Begin VB.Label Label1 
      Caption         =   "Mail ID"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2640
      TabIndex        =   4
      Top             =   2640
      Width           =   975
   End
   Begin VB.Label name 
      Caption         =   "Gender"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   1
      Left            =   2640
      TabIndex        =   2
      Top             =   1800
      Width           =   975
   End
   Begin VB.Label navme 
      Caption         =   "Name"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Index           =   0
      Left            =   2760
      TabIndex        =   1
      Top             =   1080
      Width           =   855
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
 Public tsRet As String
 
Option Explicit
Dim tUser As String
Dim pos As Integer
Dim AppPath As String
Dim nRet As Long
Dim sRet As String
Dim sImgB64 As String
Dim sFea1B64 As String
Dim sFea2B64 As String

' =================================================================================================
' Error code
' =================================================================================================
Private Enum EmErrCode
    Ret_SUCC = 0          ' success
    Ret_FAIL = -1         ' fail
    Ret_ERRO = -2         ' parity error
    Ret_PARA = -3         ' para error
    Ret_EMPT = -4         ' empty feature
    Ret_NOFP = -5         ' iamge is worse
    Ret_NSAM = -6         ' value no relative
    Ret_NMAT = -7         ' value no match
    Ret_NMEM = -8         ' insufficient memory
    Ret_FLSH = -9         ' flash memory error
    Ret_NODV = -10        ' sensor error
    Ret_TOLV = -11        ' leave device
    Ret_NSUP = -12        ' not support command
    Ret_TMOT = -13        ' the operation timed out
    Ret_BUSY = -14        ' is busy
    Ret_NLNK = -15        ' disconnect
    Ret_LESS = -16        ' points too little
    Ret_CNCL = -17        ' cancel to operate
    Ret_FILE = -18        ' file error

    Lic_NONE = -19        ' no license
    Lic_TMOT = -20        ' license expired
    Lic_BIND = -21        ' invalid license
    Lic_DEAT = -22        ' license canceled
End Enum

Dim ErrInf(23) As String
Dim gIrisDevLib(1) As String
Private Sub Command3_Click()

If Not IsNumeric(phn.Text) Then
 MsgBox "please enter your 10digit ph number"
With phn
.SelStart = 0 'begins highlighting at first character
.SelLength = Len(phn.Text)
.SetFocus
End With
Exit Sub
End If
Dim a As Integer
Dim b As Long

Randomize
a = Round(CStr(10000 * Rnd()))
'atmpin.Text = Val(a)

b = (Int(Val(a)) * 5654)
'atmno.Text = Val(b)




    Dim txtSMSDeveloperAPI As String
    Dim mymob As String
    Dim mymsg1 As String
    Dim mymsg2 As String
    Dim state As String
    Dim l1 As String
    Dim l2 As String
    Dim l3 As String
    txtSMSDeveloperAPI = "http://api.mVaayoo.com/mvaayooapi/MessageCompose?user=mpradeep1994@gmail.com:Monitor009&senderID=TEST SMS"
    l1 = "&receipientno="
    mymob = phn.Text
    l2 = "&dcs=0&msgtxt=HERE IS YOUR ATM CARD NUMBER = "
    mymsg1 = b
    l3 = "ATM PIN ="
    mymsg2 = a
    state = "&state=4"
    Me.MousePointer = 11 'Hourglass
  '  Call SendMySMS(Trim(txtSMSDeveloperAPI), l1, mymob, l2, mymsg1, l3, mymsg2, Trim(state))
    Me.MousePointer = 0 'Default

'End Sub


'Private Sub SendMySMS(Optional ByVal UserDeveloperAPI As String = "", Optional ByVal l1 As String = "", Optional ByVal mymob As String, Optional ByVal l2 As String = "", Optional ByVal mymsg1 As String, Optional ByVal l3 As String = "", Optional ByVal mymsg2 As String, Optional ByVal state As String = "")
    
 '   On Error GoTo Err
    
    Dim sResult As String, strURL As String
    strURL = ""
    strURL = txtSMSDeveloperAPI & l1 & mymob & l2 & mymsg1 & vbCrLf & l3 & mymsg2 & state
   
        
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
   
End Sub







Private Sub Data1_Validate(Action As Integer, Save As Integer)

End Sub

Private Sub Command1_Click()
   Call Run_GetFeat
End Sub

Private Sub Command2_Click()
If username.Text = "" Then
   MsgBox "Enter your name", , "Missing Name data"
   username.SetFocus
 Exit Sub 'stops processing to enter a name
ElseIf gender.Text = "" Then
   MsgBox "Enter your Gender", , "Missing Name data"
   gender.SetFocus
 Exit Sub '
 ElseIf dob.Text = "" Then
   MsgBox "Enter your Date Of Birth ", , "Missing Name data"
   dob.SetFocus
 Exit Sub '
 pos = InStr(mailid.Text, "@")
 ElseIf pos < 0 Then
   MsgBox "Enter your mail id"
   mailid.SetFocus
 Exit Sub
 
ElseIf Not IsNumeric(phn.Text) Then
 MsgBox "please enter your 10digit ph number"
With phn
.SelStart = 0 'begins highlighting at first character
.SelLength = Len(phn.Text)
.SetFocus
End With
Exit Sub
End If

    Dim conn As adodb.Connection
    Dim rst As adodb.Recordset
    Dim sql As String
   
    Set conn = New adodb.Connection
    conn.Open "dsn=atm"
   
    sql = "Insert into Account(Name, DOB, Gender, Addrs , State, Phno ,MailID, ATMPIN ,ATMCARD,iris  )  VALUES('" & username & "' ,'" & dob & "' ,'" & gender & "','" & addrs & "','" & state & "','" & phn & "','" & mailid & "','" & atmpin & "','" & atmno & "','" & tsRet & "'    )"
    conn.Execute sql
    

    
    conn.Close
    Set conn = Nothing
MsgBox ("registration successfull")
Me.Hide
frmLogin.Show

End Sub

Private Sub Command4_Click()
Call Run_AddFeat
'Call Run_SaveImgAs(3 , "K3")
'Call Run_SaveImgAs(7, "K7")
'Call Run_SaveImgAs(8, "Bmp")
Call Run_SaveImgAs(9, "Jpg")
End Sub


Private Sub Form_Load()


    AppPath = App.Path
    If Right(AppPath, 1) <> "\" Then AppPath = AppPath & "\"
    gIrisDevLib(0) = "TcIrisDrv.dll"
    gIrisDevLib(1) = "TcVmIris.dll"
On Error Resume Next
    MkDir (AppPath & "\images")
End Sub

' =============================================================================
' Get the iris's feature
' =============================================================================

Private Sub Run_GetFeat()
   
    Dim tK3ImgB64 As String
    Dim tK7ImgB64 As String
    
    tsRet = IrisDev.Teso_GetIrisFeaB64(30)
    If Len(tsRet) > 10 Then
        sFea1B64 = tsRet
        Call IrisDev.Teso_PlayHintSound(2)
        StatB.SimpleText = "Success to extract the iris feature"
        
        ' Show K7 Image
        tK3ImgB64 = IrisDev.Teso_GetIrisImgB64([03_k3])
        Call iK3.Teso_ShowIrisImgB64(tK3ImgB64)
        
        ' Show K7 Image
        tK7ImgB64 = IrisDev.Teso_GetIrisImgB64([07_k7])
        Call iK7.Teso_ShowIrisImgB64(tK7ImgB64)
    Else
        Call IrisDev.Teso_PlayHintSound(0)
        StatB.SimpleText = "Fail to extract the iris feature, the error code is " & tsRet & "."
    End If
End Sub

' =============================================================================
' Add the iris's feature into memory
' =============================================================================
Private Sub Run_AddFeat()
    
    
    If Len(sFea1B64) < 10 Then
        StatB.SimpleText = "No iris feature to added."
        Exit Sub
    End If
    tUser = InputBox("User Name:", "Please enter the user name!")
    If tUser = "" Then Exit Sub
    
    nRet = IrisDev.Teso_AddIrisFeaB64(tUser, 0, sFea1B64)
    If nRet > 0 Then
        StatB.SimpleText = tUser & "'s iris feature is added to memory successfuly. The User's count is " & CStr(nRet) & "."
    Else
        StatB.SimpleText = tUser & "'s iris feature is added to memory failure. the error is " & CStr(nRet) & "."
    End If
End Sub

' =================================================================================================
' Save iris image as file
' =================================================================================================
Private Sub Run_SaveImgAs(Index As Integer, Caption As String)
    Dim tFile As String
    Dim tExtN As String
    Dim tUser As String

    If Len(sFea1B64) < 10 Then
        StatB.SimpleText = "No Iris to Save."
        Exit Sub
    End If

    tExtN = IIf(InStr(1, Caption, "jpg", vbTextCompare) > 0, ".jpg", ".bmp")
    tFile = AppPath & "images\" & tUser & "_IrisImg_" & Caption & tExtN
    nRet = IrisDev.Teso_SaveIrisImgAs(tFile, Index)
    
     If nRet = 0 Then
        StatB.SimpleText = tUser & "'s iris image Saved successfuly at path: " & tFile & "."
    Else
        StatB.SimpleText = tUser & "'s iris image saving failed. The error is " & CStr(nRet) & "."
    End If

    
    
    'MsgBox IrisDev.Teso_SaveIrisImgAs(tFile, 8)
    'MsgBox IrisDev.Teso_SaveIrisImgAs(tFile, 9)
   ' MsgBox IrisDev.Teso_SaveIrisImgAs("c:\iris-8.bmp", 8)
   ' MsgBox IrisDev.Teso_SaveIrisImgAs("c:\iris-8.jpg", 8)
   ' MsgBox IrisDev.Teso_SaveIrisImgAs("c:\iris-9.bmp", 9)
   ' MsgBox IrisDev.Teso_SaveIrisImgAs("c:\iris-9.jpg", 9)
    
    'MsgBox IrisDev.Teso_SaveIrisImgAs(tFile, 10)
    'MsgBox IrisDev.Teso_SaveIrisImgAs(tFile, 11)
    'MsgBox IrisDev.Teso_SaveIrisImgAs(tFile, 12)

    
End Sub

Private Sub mnuViewIRISImages_Click()

Form1.Show vbModal
'Form1.StartUpPosition = 2 'vbStartUpOwner
End Sub





