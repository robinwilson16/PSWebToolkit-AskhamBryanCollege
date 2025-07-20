Option Explicit On
Option Strict On
Imports System.Drawing
Imports CompassCC.CCCSystem.CCCCommon
Imports System.Drawing.Imaging
Imports System.IO
Imports System.Linq
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports Microsoft.IdentityModel.Tokens

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

    Protected Overrides Sub CreateChildControls()
        MyBase.CreateChildControls()

        If Not String.IsNullOrEmpty(CStr(Session("19PlusOutsideAreaConfirmed"))) Then
            ConfirmNoFundingAvailable.Checked = CBool(Session("19PlusOutsideAreaConfirmed"))
        End If
    End Sub

    Public Overrides Sub ValidateControl()
        'Forename (Single Name Only)
        If Not String.IsNullOrEmpty(fldFirstForename.Value.ToString()) Then
            If (fldFirstForename.Value.ToString().Contains(" ")) Then
                fldFirstForenameValidator.ErrorMessage = "Forename or Given Name must only contain your first name with no spaces. Please Enter Any middle names into the Other Forenames (Middle Names) box below."
                fldFirstForenameValidator.IsValid = False
                fldFirstForenameValidator.CssClass = "error alert alert-danger"
                fldFirstForename.CssClass = "ErrorInput"
            End If
        End If

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

            If Not String.IsNullOrEmpty(CStr(fldDateOfBirth.Value)) Then
                dateOfBirthDate = CType(fldDateOfBirth.Value, Date)
            End If

            Dim dateToCheckDOB As Date = CDate(Today().Year & "-08-31")
            Dim minAllowedDOB As Date = dateToCheckDOB.AddYears(-16)
            Dim maxAllowedDOB As Date = dateToCheckDOB.AddYears(-70)

            If String.IsNullOrEmpty(CStr(fldDateOfBirth.Value)) Then
                fldDateOfBirthValidator.ErrorMessage = "Please enter your Date of Birth"
                fldDateOfBirthValidator.IsValid = False
                fldDateOfBirthValidator.CssClass = "error alert alert-danger"
                fldDateOfBirth.CssClass = "ErrorInput"
            ElseIf Not IsNothing(dateOfBirthDate) And dateOfBirthDate > minAllowedDOB Then
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

        'National Insurance Number
        Dim regexNI As New Regex("^(?!BG)(?!GB)(?!NK)(?!KN)(?!TN)(?!NT)(?!ZZ)(?:[A-CEGHJ-PR-TW-Z][A-CEGHJ-NPR-TW-Z])(?:\s*\d\s*){6}([A-D]|\s)$")
        If Not IsNothing(fldNI) And CStr(fldNI.Value).Length > 0 Then
            Dim match As Match = regexNI.Match(CStr(fldNI.Value))
            If Not match.Success Then
                fldNIValidator.ErrorMessage = "Please enter a valid National Insurance Number or leave blank if you do not know it"
                fldNIValidator.IsValid = False
                fldNIValidator.CssClass = "error alert alert-danger"
                fldNI.CssClass = "ErrorInput"
            End If
        End If

        'Mobile Tel
        Dim regexMobileTel As New Regex("^(07[\d]{8,12}|447[\d]{7,11})$") ' Mobile numbers should start with 07 and be 11 digits long
        Dim regexTel As New Regex("^((\(?0\d{4}\)?\s?\d{3}\s?\d{3})|(\(?0\d{3}\)?\s?\d{3}\s?\d{4})|(\(?0\d{2}\)?\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$")
        If Not IsNothing(fldMobileTel) And Not IsNothing(fldTel) Then
            If String.IsNullOrEmpty(CStr(fldMobileTel.Value)) And String.IsNullOrEmpty(CStr(fldTel.Value)) Then
                fldMobileTelValidator.ErrorMessage = "Please enter at least one phone number (Mobile number / Home phone (inc. STD code))"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldMobileTel.CssClass = "ErrorInput"
                fldTel.CssClass = "ErrorInput"
            ElseIf CStr(fldMobileTel.Value).Length > 0 And fldMobileTel.Value.ToString.Length <> 11 Then
                fldMobileTelValidator.ErrorMessage = "Your mobile phone number must be 11 digits long"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldMobileTel.CssClass = "ErrorInput"
                fldTel.CssClass = "ErrorInput"
            ElseIf CStr(fldMobileTel.Value).Length > 0 And Not fldMobileTel.Value.ToString.StartsWith("07") Then
                fldMobileTelValidator.ErrorMessage = "Your mobile phone number must start with 07"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldMobileTel.CssClass = "ErrorInput"
                fldTel.CssClass = "ErrorInput"
            ElseIf CStr(fldMobileTel.Value).Length > 0 And Not regexMobileTel.IsMatch(CStr(fldMobileTel.Value)) Then
                fldMobileTelValidator.ErrorMessage = "The format of the mobile must be beginning 07, with no spaces and 11 digits in length e.g. 07771900900"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldMobileTel.CssClass = "ErrorInput"
            ElseIf CStr(fldTel.Value).Length > 0 And Not regexTel.IsMatch(CStr(fldTel.Value)) Then
                fldMobileTelValidator.ErrorMessage = "The format of the home telephone must be a UK standard number begining with 0, with no spaces e.g. 01273800900"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
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
            ElseIf FileUpload1.FileBytes.Length > 5 * 1000 * 1000 Then
                PhotoPathValidator.ErrorMessage = "This file is " + Math.Round((FileUpload1.FileBytes.Length / 1000 / 1000), 2).ToString + "MB which is too large as the maximum permitted file size is 5MB. Please choose a smaller file."
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
