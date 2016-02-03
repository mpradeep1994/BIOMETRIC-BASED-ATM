VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{6D7C9DDD-EBA0-4CEF-BFE4-F54FB0B59FBE}#1.0#0"; "TIrisMonoA.ocx"
Begin VB.Form Frm1 
   BackColor       =   &H00E0E0E0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "BioEnable IRIS ONE (www.BioEnableTech.com)"
   ClientHeight    =   8025
   ClientLeft      =   45
   ClientTop       =   735
   ClientWidth     =   14550
   BeginProperty Font 
      Name            =   "Arial"
      Size            =   9.75
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "Frm1.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   535
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   970
   StartUpPosition =   2  'CenterScreen
   Begin TIrisMonoA.IrisMonoA iK7 
      Height          =   3375
      Left            =   9750
      TabIndex        =   5
      Top             =   3900
      Width           =   4500
      _ExtentX        =   7938
      _ExtentY        =   5953
   End
   Begin TIrisMonoA.IrisMonoA iK3 
      Height          =   3375
      Left            =   9720
      TabIndex        =   4
      Top             =   240
      Width           =   4500
      _ExtentX        =   7938
      _ExtentY        =   5953
   End
   Begin TIrisMonoA.IrisMonoA IrisDev 
      Height          =   7080
      Left            =   75
      TabIndex        =   3
      Top             =   240
      Width           =   9480
      _ExtentX        =   16722
      _ExtentY        =   12488
   End
   Begin MSComctlLib.StatusBar StatB 
      Align           =   2  'Align Bottom
      Height          =   660
      Left            =   0
      TabIndex        =   0
      Top             =   7365
      Width           =   14550
      _ExtentX        =   25665
      _ExtentY        =   1164
      Style           =   1
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "K7 image"
      Height          =   195
      Left            =   9750
      TabIndex        =   2
      Top             =   3675
      Width           =   840
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "K3 image"
      Height          =   195
      Left            =   9720
      TabIndex        =   1
      Top             =   0
      Width           =   840
   End
   Begin VB.Menu MnuGetFeat 
      Caption         =   "Capture &IRIS"
   End
   Begin VB.Menu MnuAddFeat 
      Caption         =   "&Save in Memory"
   End
   Begin VB.Menu MnuClearFeat 
      Caption         =   "&Clear Memory"
   End
   Begin VB.Menu MnuVerFeat 
      Caption         =   "&Verify IRIS"
   End
   Begin VB.Menu MnuSaveIrisImage 
      Caption         =   "Sa&ve Image"
      Begin VB.Menu MnuSaveAs 
         Caption         =   "K1"
         Index           =   1
         Visible         =   0   'False
      End
      Begin VB.Menu MnuSaveAs 
         Caption         =   "K2"
         Index           =   2
         Visible         =   0   'False
      End
      Begin VB.Menu MnuSaveAs 
         Caption         =   "K3"
         Index           =   3
      End
      Begin VB.Menu MnuSaveAs 
         Caption         =   "K7"
         Index           =   7
      End
      Begin VB.Menu MnuSaveAs 
         Caption         =   "Bmp"
         Index           =   8
      End
      Begin VB.Menu MnuSaveAs 
         Caption         =   "Jpg"
         Index           =   9
      End
      Begin VB.Menu MnuSaveAs 
         Caption         =   "Raw"
         Index           =   10
         Visible         =   0   'False
      End
   End
   Begin VB.Menu mnuViewIRISImages 
      Caption         =   "&View Saved IRIS Images"
   End
End
Attribute VB_Name = "Frm1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
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

Private Sub Form_Load()
frmLogin.Show
Me.Hide

    AppPath = App.Path
    If Right(AppPath, 1) <> "\" Then AppPath = AppPath & "\"
    gIrisDevLib(0) = "TcIrisDrv.dll"
    gIrisDevLib(1) = "TcVmIris.dll"
On Error Resume Next
    MkDir (AppPath & "\images")
End Sub

Private Sub MnuGetFeat_Click()
    Call Run_GetFeat
End Sub

Private Sub MnuAddFeat_Click()
    Call Run_AddFeat
End Sub

Private Sub MnuClearFeat_Click()
    Call Run_ClearFeat
End Sub

Private Sub MnuSaveAs_Click(Index As Integer)
    Call Run_SaveImgAs(Index)
End Sub

Private Sub MnuVerFeat_Click()
    Call Run_VerFeat
End Sub

Private Sub MnuVerifyFeat_Click()
    Call Run_VerFeat
End Sub

Private Sub Run_GetFeat()
    Dim tsRet As String
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
    Dim tUser As String
    
    If Len(sFea1B64) < 10 Then
        StatB.SimpleText = "No iris feature to add."
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

' =============================================================================
' Clear all iris's features in memory
' =============================================================================
Private Sub Run_ClearFeat()
    If MsgBox("Are you sure to clear the user information?", vbQuestion + vbYesNo) = vbNo Then Exit Sub
    Call IrisDev.Teso_ClsIrisFeaB64
    StatB.SimpleText = "User information is cleared."
End Sub

' =============================================================================
' Input one iris's feature to verify with iris's features in memory
' =============================================================================
Private Sub Run_VerFeat()
    Dim tUser As String
    
    StatB.SimpleText = ""
    If IrisDev.Teso_GetUserFeaCnt <= 0 Then
        StatB.SimpleText = "No user information in memory."
        Exit Sub
    End If
    
    ' method 1
    sFea2B64 = IrisDev.Teso_GetIrisFeaB64(30)
    If Len(sFea2B64) > 10 Then
        '将传入的虹膜特征与内存中的虹膜特征进行比对
        tUser = IrisDev.Teso_VerIrisFeaB64("", 0, sFea2B64, 3)
        If Left(tUser, 1) <> "-" And tUser <> "" Then
            Call IrisDev.Teso_PlayHintSound(3)
            StatB.SimpleText = "Welcome " & tUser & "."
            Me.Hide
            Form3.Show
            
        Else
            Call IrisDev.Teso_PlayHintSound(0)
            StatB.SimpleText = "Fail to verify, the error is " & tUser & "."
            
        End If
    Else
        Call IrisDev.Teso_PlayHintSound(0)
        StatB.SimpleText = "Fail to extract the iris feature."
    End If

    ' method 2
    
    tUser = IrisDev.Teso_VerIrisFeaB64Ex("", 0, 3, 30)
    If tUser <> "" Then
        If Left(tUser, 1) <> "-" Then
            Call IrisDev.Teso_PlayHintSound(3)
            StatB.SimpleText = "Welcome " & tUser & "."
               Me.Hide
            Form3.Show
        Else
            Call IrisDev.Teso_PlayHintSound(0)
            StatB.SimpleText = "Fail to verify, the error is " & tUser & "."
        End If
    Else
        Call IrisDev.Teso_PlayHintSound(0)
        StatB.SimpleText = "Fail to verify"
    End If
End Sub

' =================================================================================================
' Save iris image as file
' =================================================================================================
Private Sub Run_SaveImgAs(Index As Integer)
    Dim tFile As String
    Dim tExtN As String
    
    Dim tUser As String

    If Len(sFea1B64) < 10 Then
        StatB.SimpleText = "No Iris to Save."
        Exit Sub
    End If
    tUser = InputBox("User Name:", "Please enter the user name!")
    If tUser = "" Then tUser = "No-Name" 'Exit Sub


    tExtN = IIf(InStr(1, MnuSaveAs(Index).Caption, "jpg", vbTextCompare) > 0, ".jpg", ".bmp")
    tFile = AppPath & "images\" & tUser & "_IrisImg_" & MnuSaveAs(Index).Caption & tExtN
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


