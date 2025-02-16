Option Explicit On
Option Strict On
Imports System.Drawing
Imports CompassCC.CCCSystem.CCCCommon
Imports System.Drawing.Imaging
Imports System.IO
Imports System.Linq
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class checkout_applications
    Inherits CheckoutBaseControl

    Public OfferingID As Integer
    Public Course As Course
    Public IsPhotoRequired As Boolean = True
    Public ShowBackButton As Boolean = False

    Protected Overrides Sub RenderChildren(writer As HtmlTextWriter)
        MyBase.RenderChildren(writer)
    End Sub

    Public Overrides Sub RenderControl(writer As HtmlTextWriter)
        MyBase.RenderControl(writer)

        'Dim ctl As DropDownList = TryCast(fldStudentFirstLanguageID.InternalFieldControl, DropDownList)
        'Dim itemsInDropDown = ctl.Items

    End Sub


    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)

        'Show back button if arrived here from search
        If Not IsNothing(Request.UrlReferrer) Then
            If Request.UrlReferrer.ToString.Contains("Dept=") Or Request.UrlReferrer.ToString.Contains("Search=") Then
                ShowBackButton = True
            End If
        End If

        If Not WorkingData.EnrolmentRequestRow.Photo Is Nothing Then
            Dim base64String As String = Convert.ToBase64String(WorkingData.EnrolmentRequestRow.Photo, 0, WorkingData.EnrolmentRequestRow.Photo.Length)
            Image1.ImageUrl = "data:image/png;base64," & base64String
        Else
            Image1.ImageUrl = "/PSWebEnrolment/images/BlankPhoto.png"
        End If

        OfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(OfferingID)

        'Dim ctl = fldStudentFirstLanguageID.InternalFieldControl

        If PaymentSubmitter.AllowEmptyBasket And WorkingData.ShoppingCart.Items.Count = 0 Then
            Session("RequestMode") = RequestMode.ApplicationRequest
        End If

        If Not IsPostBack Then

            postcode.Value = WorkingData.EnrolmentRequestRow.PostcodeOut & WorkingData.EnrolmentRequestRow.PostcodeIn
            WorkingData.EnrolmentRequestRow.RestrictedUseAllowContactByEmail = True
        End If
    End Sub

    Public Overrides Sub ValidateControl()
        'Post Code
        If Not IsNothing(postcode) Then
            Dim regexPostCode As New Regex("^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$")
            Dim match As Match = regexPostCode.Match(postcode.Value)
            If Not match.Success Then
                postcodeValidator.ErrorMessage = "Please enter a valid Postcode"
                postcodeValidator.IsValid = False
                postcodeValidator.CssClass = "error alert alert-danger"
                postcode.Attributes.Add("Class", "textfield form-control ErrorInput")
            End If
        End If

        'DOB
        If Not IsNothing(fldDateOfBirth) Then
            Dim dateOfBirthDate As Date?

            If Not String.IsNullOrEmpty(fldDateOfBirth.Value.ToString) Then
                dateOfBirthDate = CType(fldDateOfBirth.Value, Date)
            End If

            Dim dateToCheckDOB As Date = CDate(Today().Year & "-08-31")
            Dim minAllowedDOB As Date = dateToCheckDOB.AddYears(-16)
            Dim maxAllowedDOB As Date = dateToCheckDOB.AddYears(-70)

            If Not IsNothing(dateOfBirthDate) And dateOfBirthDate > minAllowedDOB Then
                fldDateOfBirthValidator.ErrorMessage = "You cannot be aged under 16 (on " & dateToCheckDOB.ToString("dd MMM yyyy") & ")"
                fldDateOfBirthValidator.IsValid = False
                fldDateOfBirthValidator.CssClass = "error alert alert-danger"
                fldDateOfBirth.CssClass = "ErrorInput"
            ElseIf Not IsNothing(dateOfBirthDate) And dateOfBirthDate < maxAllowedDOB Then
                fldDateOfBirthValidator.ErrorMessage = "You cannot be aged over 70 (on " & dateToCheckDOB.ToString("dd MMM yyyy") & ")"
                fldDateOfBirthValidator.IsValid = False
                fldDateOfBirthValidator.CssClass = "error alert alert-danger"
                fldDateOfBirth.CssClass = "ErrorInput"
            End If
        End If

        'NI Number
        If Not IsNothing(fldNINumber) Then
            Dim regexNINumber As New Regex("^(?!BG)(?!GB)(?!NK)(?!KN)(?!TN)(?!NT)(?!ZZ)(?:[A-CEGHJ-PR-TW-Z][A-CEGHJ-NPR-TW-Z])(?:\s*\d\s*){6}([A-D]|\s)$$")

            Dim matchNINumber As Match = regexNINumber.Match(fldNINumber.Value.ToString())

            If fldNINumber.Value.ToString.Length > 0 And Not matchNINumber.Success Then
                fldNINumberValidate.ErrorMessage = "Please enter a valid National Insurance Number"
                fldNINumberValidate.IsValid = False
                fldNINumberValidate.CssClass = "error alert alert-danger"
                fldNINumber.CssClass = "ErrorInput"
            End If
        End If

        'Mobile and Tel
        Dim regexLandlineTel As New Regex("^(?:\+44\s?|0)[1238]\d\s?(?:\d\s?){7,8}$")
        Dim regexMobileTel As New Regex("(07[\d]{8,12}|447[\d]{7,11})$")
        Dim matchTel1 As Match = regexLandlineTel.Match(fldTel.Value.ToString())
        Dim matchTel2 As Match = regexMobileTel.Match(fldTel.Value.ToString()) 'Allow a mobile for other tel
        Dim matchMobileTel As Match = regexMobileTel.Match(fldMobileTel.Value.ToString())

        If Not IsNothing(fldMobileTel) Then
            If String.IsNullOrEmpty(fldTel.Value.ToString) And String.IsNullOrEmpty(fldMobileTel.Value.ToString) Then
                fldMobileTelValidator.ErrorMessage = "Please enter at least a home phone number or a mobile number"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldMobileTel.CssClass = "ErrorInput"
            ElseIf fldMobileTel.Value.ToString.Length <> 11 Then
                fldMobileTelValidator.ErrorMessage = "Your mobile phone number must be 11 digits long"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldMobileTel.CssClass = "ErrorInput"
                fldTel.CssClass = "ErrorInput"
            ElseIf Not fldMobileTel.Value.ToString.StartsWith("07") Then
                fldMobileTelValidator.ErrorMessage = "Your mobile phone number must start with 07"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldMobileTel.CssClass = "ErrorInput"
                fldTel.CssClass = "ErrorInput"
            End If
        End If

        If Not IsNothing(fldMobileTel) Then
            If Not String.IsNullOrEmpty(fldMobileTel.Value.ToString) And Not matchMobileTel.Success Then
                fldMobileTelValidator.ErrorMessage = "Please enter a valid UK mobile number starting 07 containing no spaces"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldMobileTel.CssClass = "ErrorInput"
            End If
        End If

        If Not IsNothing(fldTel) Then
            If Not String.IsNullOrEmpty(fldTel.Value.ToString) And Not (matchTel1.Success Or matchTel2.Success) Then
                fldTelValidator.ErrorMessage = "Please enter a valid Telephone Number"
                fldTelValidator.IsValid = False
                fldTelValidator.CssClass = "error alert alert-danger"
                fldTel.CssClass = "ErrorInput"
            End If
        End If

        If WorkingData.EnrolmentRequestRow.MobileTel = WorkingData.EnrolmentRequestRow.ParentMobileTel Then
            fldMobileTelValidator.ErrorMessage = "You must provide a different emergency contact number to your own mobile number " + WorkingData.EnrolmentRequestRow.MobileTel
            fldMobileTelValidator.IsValid = False
            fldMobileTelValidator.CssClass = "error alert alert-danger"
            fldMobileTel.CssClass = "ErrorInput"
        End If

        If WorkingData.EnrolmentRequestRow.Email = WorkingData.EnrolmentRequestRow.ParentEmailAddress Then
            fldEmailValidator.ErrorMessage = "You must provide a different emergency email address to your own email address " + WorkingData.EnrolmentRequestRow.Email
            fldEmailValidator.IsValid = False
            fldEmailValidator.CssClass = "error alert alert-danger"
            fldEmail.CssClass = "ErrorInput"
        End If

        'Devolution Funding
        If Not IsNothing(ConfirmNoFundingAvailable) Then
            If DevolutionAreaIsFunded.Checked = False And ConfirmNoFundingAvailable.Checked = False Then
                ConfirmNoFundingAvailableValidator.ErrorMessage = "Please confirm you acknowlege your fees may be significantly higher as you live in " & ExpectedSourceOfFundingName.Text & "."
                ConfirmNoFundingAvailableValidator.IsValid = False
                ConfirmNoFundingAvailableValidator.CssClass = "error alert alert-danger"
                ConfirmNoFundingAvailable.CssClass = "ErrorInput"
            End If
        End If

        'Photo Validation
        Dim validExtensions As String() = {".jpg", ".jpeg", ".png", ".gif", ".bmp", ".heic"}

        If Not IsNothing(StudentDetailUserDefined24) Then
            If WorkingData.EnrolmentRequestRow.Photo Is Nothing And (CType(StudentDetailUserDefined24.Value, String) = "" Or CType(StudentDetailUserDefined24.Value, String) = "OK") And IsPhotoRequired = True Then
                PhotoPathValidator.ErrorMessage = "Please upload your photo by clicking on Choose File. If you cannot upload your photo then please state the reason why."
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            End If
        Else
            If WorkingData.EnrolmentRequestRow.Photo Is Nothing And IsPhotoRequired = True Then
                PhotoPathValidator.ErrorMessage = "Please upload your photo by clicking on Choose File. If you cannot upload your photo then please state the reason why."
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            End If
        End If

        MyBase.ValidateControl()
    End Sub

    Protected Sub Upload(ByVal sender As Object, ByVal e As EventArgs)
        Dim validExtensions As String() = {".jpg", ".jpeg", ".png", ".gif", ".bmp", ".heic"}

        Page.MaintainScrollPositionOnPostBack = True
        Session("Image") = FileUpload1.PostedFile
        Dim fs As Stream = FileUpload1.PostedFile.InputStream()
        Dim br As BinaryReader = New BinaryReader(fs)
        Dim bytes As Byte() = br.ReadBytes(CInt(fs.Length))
        Dim base64String As String = Convert.ToBase64String(bytes, 0, bytes.Length)
        Dim imgPath As String = "data:image/png;base64," & base64String
        Dim fileName As String = FileUpload1.PostedFile.FileName
        PhotoFilename.Text = fileName

        'Panel1.Visible = True
        'Response.BinaryWrite(bytes)

        'Check Image is Valid
        If Not IsNothing(fileName) Then
            If String.IsNullOrEmpty(fileName) Then
                PhotoPathValidator.ErrorMessage = "Please click Choose File above first to browse your device for the photo you wish to use. If you cannot provide evidence at present, please instead select a reason why below."
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            ElseIf fileName.LastIndexOf(".") <= 0 Then
                PhotoPathValidator.ErrorMessage = "This type of file is not valid. Please upload a valid image file"
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            ElseIf validExtensions.Contains(fileName.Substring(fileName.LastIndexOf(".")).ToLower) = False Then
                PhotoPathValidator.ErrorMessage = "This type of file is not valid. Please upload a valid image file"
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            ElseIf FileUpload1.FileBytes.Length > 5000 Then
                PhotoPathValidator.ErrorMessage = "This file is too large as the maximum permitted file size is 5MB. Please choose a smaller file."
                PhotoPathValidator.IsValid = False
                PhotoPathValidator.CssClass = "error alert alert-danger"
                FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
            Else
                Image1.ImageUrl = imgPath
                WorkingData.EnrolmentRequestRow.Photo = bytes
            End If
        End If
    End Sub

    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then
            WorkingData.ApplicationRequestRow.Surname = Trim(fldSurname.Value.ToString)
            WorkingData.ApplicationRequestRow.FirstForename = Trim(fldFirstForename.Value.ToString)

            WorkingData.EnrolmentRequestRow.Surname = Trim(fldSurname.Value.ToString)
            WorkingData.EnrolmentRequestRow.FirstForename = Trim(fldFirstForename.Value.ToString)

            'postcode stuff            
            ''CCCPS-77326: Setting flag to false so Main Address screen opens when coming from this page.
            PSWebEnrolmentProperties.IsCurrentlyTakingAltAddress = False
            If Len(postcode.Value.Trim) > 0 Then
                WorkingData.EnrolmentRequestRow.PostcodeOut = postcode.Value.Trim.Substring(0, postcode.Value.Trim.Length - 3).Trim
                WorkingData.EnrolmentRequestRow.PostcodeIn = Right(postcode.Value.Trim, 3).Trim

                WorkingData.ApplicationRequestRow.PostcodeOut = postcode.Value.Trim.Substring(0, postcode.Value.Trim.Length - 3).Trim
                WorkingData.ApplicationRequestRow.PostcodeIn = Right(postcode.Value.Trim, 3).Trim
            End If

            If FileUpload1.HasFile Then
                'CCCPS-81336 - Feature to reduce the size of image in Photo Control. Have changed control from ASP FileUpload control CCCFileUpload but yes I am not validating this as of now.
                Dim validExtensions As String() = {".jpg", ".jpeg", ".png", ".gif", ".bmp"}
                Dim fileExtension As String = IO.Path.GetExtension(FileUpload1.FileName).ToLower()

                If SystemSettings.UseImageResizeFeature AndAlso validExtensions.Contains(fileExtension) Then
                    Dim originalImage As Image = Image.FromStream(FileUpload1.PostedFile.InputStream)
                    WorkingData.EnrolmentRequestRow.Photo = CCCPageLibrary.GetImageFileBytes(originalImage)
                Else
                    Dim fs As System.IO.Stream = FileUpload1.PostedFile.InputStream()
                    Dim MyData(CInt(fs.Length)) As Byte
                    fs.Read(MyData, 0, CInt(fs.Length))
                    fs.Close()

                    WorkingData.EnrolmentRequestRow.Photo = MyData
                End If
            End If
        End If
    End Sub

    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Dim resource = Global.Resources.Resource.courseapply_abc
        Response.Redirect(resource & "&OfferingID=" & OfferingID)
        'Response.Redirect("/PSWebEnrolment/webenrolment.aspx?page=~/apply/courseapply.ascx&OfferingID=" & OfferingID())
    End Sub

    'Public ReadOnly Property OfferingID() As Integer
    '    Get
    '        'Get first selected offering ID - would need another approach if learners can select multiple
    '        Dim selectedOfferingID As Integer? = WorkingData.ShoppingCart.Items.Item(0).OfferingID
    '        If Not selectedOfferingID >= 0 Then
    '            selectedOfferingID = -1
    '        End If

    '        Return CInt(selectedOfferingID)
    '    End Get
    'End Property
End Class
