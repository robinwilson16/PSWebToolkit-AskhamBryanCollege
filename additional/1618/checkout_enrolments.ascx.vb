
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports Microsoft.VisualBasic.ApplicationServices
Imports System.Data
Imports PdfSharp.Pdf.Content.Objects
Imports CommandType = System.Data.CommandType
Imports System.Data.SqlClient

Partial Class webcontrols_checkout_enrolments
    Inherits CheckoutBaseControl

    Public OfferingID As Integer
    Public Course As Course
    Public ReferenceDate As Date
    Public ConsentDate As Date
    Public ShowBackButton As Boolean = False

    Protected Overrides Sub OnLoad(e As EventArgs)

        OfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(OfferingID)

        'Show back button if arrived here from search
        If Not IsNothing(Request.UrlReferrer) Then
            If Request.UrlReferrer.ToString.Contains("Dept=") Or Request.UrlReferrer.ToString.Contains("Search=") Then
                ShowBackButton = True
            End If
        End If

        ReferenceDate = CDate(Today().Year & "-08-31")
        ConsentDate = ReferenceDate.AddYears(-18)

        If IsDate(WorkingData.EnrolmentRequestRow.DateOfBirth) Then
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth.GetValueOrDefault, Date), ReferenceDate) / 365.25)
        End If

        If IsDate(WorkingData.EnrolmentRequestRow.DateOfBirth) And IsDate(OfferingDataTable.FetchByOfferingID(OfferingID).StartDate) Then
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth.GetValueOrDefault, Date), OfferingDataTable.FetchByOfferingID(OfferingID).StartDate.GetValueOrDefault) / 365.25)
        End If


        If IsPostBack Then
            '   UpdateAddress()

        Else
            postcode.Value = WorkingData.EnrolmentRequestRow.PostcodeOut + WorkingData.EnrolmentRequestRow.PostcodeIn
            AltPostcode.Value = WorkingData.EnrolmentRequestRow.AltPostcodeOut + WorkingData.EnrolmentRequestRow.AltPostcodeIn
        End If

        If Not (IsPostBack) Then

            If WorkingData.EnrolmentRequestRow.AccommodationTypeID = 11 Then
                ddCollegeAccomodation.SelectedValue = 1
            Else
                ddCollegeAccomodation.SelectedValue = 0
            End If
        End If

        'WorkingData.EnrolmentRequestRow.Title = "Mr"
        'WorkingData.EnrolmentRequestRow.Surname = "test"
        'WorkingData.ApplicationRequestRow.ApplicationTypeID = "1"
        'WorkingData.ApplicationRequestRow.ApplicationUserDefined2 = "York"
        'WorkingData.ApplicationRequestRow.ApplicationUserDefined3 = "Hort"
        'WorkingData.EnrolmentRequestRow.PriorAttainmentLevelID = "01"
        'WorkingData.EnrolmentRequestRow.FirstForename = "Test"
        'WorkingData.EnrolmentRequestRow.DateOfBirth = "30/08/2002"
        'WorkingData.EnrolmentRequestRow.Sex = "F"
        'WorkingData.EnrolmentRequestRow.Address1 = "317"
        'WorkingData.EnrolmentRequestRow.Address2 = "Test Road"
        'WorkingData.EnrolmentRequestRow.Address3 = "Test Road"
        'WorkingData.EnrolmentRequestRow.Address4 = "Test Road"
        'WorkingData.EnrolmentRequestRow.PostcodeOut = "B74"
        'WorkingData.EnrolmentRequestRow.PostcodeIn = "4BZ"
        'WorkingData.EnrolmentRequestRow.Email = "a@a.com"
        'WorkingData.EnrolmentRequestRow.MobileTel = "07853318366"
        'Response.Write(SQLDBDataReader.GetString(7))

        'If Not WorkingData.CurrentLoggedOnUserRow Is Nothing Then

        '    If Not WorkingData.CurrentLoggedOnUserRow.Email Is Nothing Then
        '        'Dim SQLDBDataReader As SqlClient.SqlDataReader
        '        'Dim SQLDataTable As New DataTable
        '        'Dim cmd As New SqlCommand
        '        'Dim SQLCmd As New SqlClient.SqlConnection
        '        'SQLCmd.ConnectionString = GetConn()
        '        'SQLCmd.Open()
        '        'cmd.CommandText = "PSWebenrolmentReports.dbo.spGetStudentDetailsByEmail"
        '        'cmd.CommandType = CommandType.StoredProcedure
        '        'cmd.Connection = SQLCmd
        '        'cmd.Parameters.AddWithValue("email", WorkingData.CurrentLoggedOnUserRow.Email)
        '        'SQLDBDataReader = cmd.ExecuteReader()

        '        Dim conn As New SqlConnection("Server=DEV18;Database=PSWebenrolmentReports;User Id=SSRS_ReadOnly; Password=123456")
        '        Dim cmd As SqlCommand = conn.CreateCommand
        '        conn.Open()
        '        Dim email As String = "amrikaujla@gmail.com"
        '        cmd.CommandType = CommandType.StoredProcedure
        '        cmd.Parameters.Add(New SqlParameter("@email", email))
        '        cmd.CommandText = "PSWebenrolmentReports.dbo.spGetStudentDetailsByEmail"
        '        'cmd.ExecuteNonQuery()
        '        Dim SQLDBDataReader As SqlDataReader
        '        SQLDBDataReader = cmd.ExecuteReader()

        '        If SQLDBDataReader.HasRows Then
        '            While (SQLDBDataReader.Read)
        '                If Not IsDBNull(SQLDBDataReader("refno")) Then
        '                    Session("refno") = CStr(SQLDBDataReader("refno"))
        '                    WorkingData.EnrolmentRequestRow.RefNo = CStr(SQLDBDataReader("refno"))
        '                End If
        '                If Not IsDBNull(SQLDBDataReader("surname")) Then
        '                    WorkingData.EnrolmentRequestRow.Surname = CStr(SQLDBDataReader("surname"))
        '                    Session("snamereadonly") = "Y"
        '                End If
        '                If Not IsDBNull(SQLDBDataReader("firstforename")) Then
        '                    WorkingData.EnrolmentRequestRow.FirstForename = CStr(SQLDBDataReader("firstforename"))
        '                    Session("fnamereadonly") = "Y"
        '                End If
        '                If Not IsDBNull(SQLDBDataReader("dateofbirth")) Then
        '                    If IsDate(SQLDBDataReader("dateofbirth")) Then
        '                        WorkingData.EnrolmentRequestRow.DateOfBirth = CDate(SQLDBDataReader("dateofbirth"))
        '                        Session("dobreadonly") = "Y"
        '                    End If
        '                End If

        '                If Not IsDBNull(SQLDBDataReader("sex")) Then WorkingData.EnrolmentRequestRow.Sex = CStr(SQLDBDataReader("sex"))
        '                If Not IsDBNull(SQLDBDataReader("schoolid")) Then WorkingData.EnrolmentRequestRow.SchoolID = CInt(SQLDBDataReader("schoolid"))
        '                If Not IsDBNull(SQLDBDataReader("address1")) Then
        '                    WorkingData.EnrolmentRequestRow.Address1 = CStr(SQLDBDataReader("address1"))
        '                    divAddresslines.Visible = True
        '                End If
        '                If Not IsDBNull(SQLDBDataReader("address2")) Then WorkingData.EnrolmentRequestRow.Address2 = CStr(SQLDBDataReader("address2"))
        '                If Not IsDBNull(SQLDBDataReader("address3")) Then WorkingData.EnrolmentRequestRow.Address3 = CStr(SQLDBDataReader("address3"))
        '                If Not IsDBNull(SQLDBDataReader("address4")) Then WorkingData.EnrolmentRequestRow.Address4 = CStr(SQLDBDataReader("address4"))
        '                If Not IsDBNull(SQLDBDataReader("postcodeout")) Then WorkingData.EnrolmentRequestRow.PostcodeOut = CStr(SQLDBDataReader("postcodein"))
        '                If Not IsDBNull(SQLDBDataReader("postcodein")) Then WorkingData.EnrolmentRequestRow.PostcodeIn = CStr(SQLDBDataReader("postcodeout"))
        '                If Not IsDBNull(SQLDBDataReader("postcodeout")) And Not IsDBNull(SQLDBDataReader("postcodein")) Then postcode.Value = WorkingData.EnrolmentRequestRow.PostcodeOut + " " + WorkingData.EnrolmentRequestRow.PostcodeIn
        '                If Not IsDBNull(SQLDBDataReader("email")) Then WorkingData.EnrolmentRequestRow.Email = CStr(SQLDBDataReader("email"))
        '                If Not IsDBNull(SQLDBDataReader("mobiletel")) Then WorkingData.EnrolmentRequestRow.MobileTel = CStr(SQLDBDataReader("mobiletel"))
        '                'Response.Write(SQLDBDataReader.GetString(7))
        '                'Response.Write(SQLDBDataReader.GetString(5))
        '            End While
        '        End If
        '        conn.Close()
        '        SQLDBDataReader.Close()
        '    End If

        'End If

        'If Not Session("refno") Is Nothing Then
        '    lblRefno.Text = CType(Session("refno"), String)
        '    divRefno.Visible = True
        'End If

        'If Session("snamereadonly") = "Y" Then fldSurname.IsReadOnly = True
        'If Session("fnamereadonly") = "Y" Then fldFirstName.IsReadOnly = True
        'If Session("dobreadonly") = "Y" Then datepicker.IsReadOnly = True

        MyBase.OnLoad(e)
    End Sub

    Protected Overrides Sub CreateChildControls()
        MyBase.CreateChildControls()

        'If IsPostBack Then
        If Not String.IsNullOrEmpty(Session("RadioButtonListAlt")) Then
                RadioButtonListAlt.SelectedValue = Session("RadioButtonListAlt")
            End If
        'End If
    End Sub

    Public Overrides Sub ValidateControl()

        'If Len(txtAddress1.Value) = 0 Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "You must enter the 1st line of the address"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If

        'Title
        'If Not IsNothing(fldTitle) Then
        '    If String.IsNullOrEmpty(fldTitle.Value) Then
        '        fldTitleValidator.ErrorMessage = "Title must not be blank"
        '        fldTitleValidator.IsValid = False
        '        fldTitleValidator.CssClass = "error alert alert-danger"
        '        fldTitle.CssClass = "ErrorInput"
        '    End If
        'End If

        'Gender
        If Not IsNothing(fldGender) Then
            If String.IsNullOrEmpty(fldGender.Value) Then
                fldGenderValidator.ErrorMessage = "Legal Gender must not be blank"
                fldGenderValidator.IsValid = False
                fldGenderValidator.CssClass = "error alert alert-danger"
                fldGender.CssClass = "ErrorInput"
            End If
        End If

        'Criminal Convictions
        If Not IsNothing(fldCriminalConvictionID) Then
            If String.IsNullOrEmpty(fldCriminalConvictionID.Value) Then
                fldCriminalConvictionIDValidator.ErrorMessage = "Criminal Convictions must not be blank"
                fldCriminalConvictionIDValidator.IsValid = False
                fldCriminalConvictionIDValidator.CssClass = "error alert alert-danger"
                fldCriminalConvictionID.CssClass = "ErrorInput"
            End If
        End If


        'Post Code
        Dim regexPostCode As New Regex("^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$")
        If Not IsNothing(postcode) Then
            Dim match As Match = regexPostCode.Match(postcode.Value)
            If Not match.Success Then
                postcodeValidator.ErrorMessage = "Please enter a valid Postcode"
                postcodeValidator.IsValid = False
                postcodeValidator.CssClass = "error alert alert-danger"
                postcode.Attributes.Add("Class", "textfield form-control ErrorInput")
            End If
        End If

        '''lewis @adnvanced
        'Dim regexEmail As New Regex("^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$")
        'Dim matchE As Match = regexEmail.Match(fldEmail.Value)
        'If Not matchE.Success Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Please enter a valid email"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If

        'Mobile Tel
        If Not IsNothing(fldMobileTel) And Not IsNothing(fldTel) Then
            If String.IsNullOrEmpty(fldMobileTel.Value) And String.IsNullOrEmpty(fldTel.Value) Then
                fldMobileTelValidator.ErrorMessage = "Please enter at least one phone number (Mobile number / Home phone (inc. STD code))"
                fldMobileTelValidator.IsValid = False
                fldMobileTelValidator.CssClass = "error alert alert-danger"
                fldMobileTel.CssClass = "ErrorInput"
                fldTel.CssClass = "ErrorInput"
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

        If ddCollegeAccomodation.SelectedValue = "" Then
            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Will you be living in College accommodation? must not be blank"
            Me.Page.Validators.Add(a)
            ddCollegeAccomodation.Style.Add("border", "1px solid red")
        End If

        If RadioButtonListAlt.SelectedValue = "" Then
            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Is your term time address different to your home address? must not be blank"
            Me.Page.Validators.Add(a)
            RadioButtonListAlt.Style.Add("border", "1px solid red")
        End If

        'Dim startDate As Date = "02/09/2023"
        'Dim refDate As Date = "31/08/2023"

        'If IsDate(WorkingData.EnrolmentRequestRow.DateOfBirth) Then
        '    ' Session("age") = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), refDate) / 365.25)
        '    WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), refDate) / 365.25)
        '    If IsDate(startDate) Then
        '        'Session("agecourse") = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), startDate) / 365.25)
        '        WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), startDate) / 365.25)
        '    End If
        'End If

        Dim matchAltPostcode As Match = regexPostCode.Match(AltPostcode.Value)
        If Not IsNothing(RadioButtonListAlt) Then
            If RadioButtonListAlt.SelectedValue = "1" Then
                If Not IsNothing(AltAddress1) Then
                    If String.IsNullOrEmpty(AltAddress1.Value.ToString) Then
                        AltAddress1Validator.ErrorMessage = "As you have said your term time address is different please enter the house number and street"
                        AltAddress1Validator.IsValid = False
                        AltAddress1Validator.CssClass = "error alert alert-danger"
                        AltAddress1.CssClass = "ErrorInput"
                    End If
                End If

                If Not IsNothing(AltPostcode) Then
                    If String.IsNullOrEmpty(AltPostcode.Value.ToString) Then
                        AltPostcodeValidator.ErrorMessage = "As you have said your term time address is different please enter the post code"
                        AltPostcodeValidator.IsValid = False
                        AltPostcodeValidator.CssClass = "error alert alert-danger"
                        AltPostcode.Attributes.Add("Class", "textfield form-control ErrorInput")
                    ElseIf Not matchAltPostcode.Success Then
                        AltPostcodeValidator.ErrorMessage = "Please enter a valid post code for your term time address"
                        AltPostcodeValidator.IsValid = False
                        AltPostcodeValidator.CssClass = "error alert alert-danger"
                        AltPostcode.Attributes.Add("Class", "textfield form-control ErrorInput")
                    End If
                End If
            End If
        End If

        MyBase.ValidateControl()
    End Sub

    Private Sub RadioButtonListAlt_Change(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButtonListAlt.SelectedIndexChanged
        If RadioButtonListAlt.SelectedValue = 2 Then
            WorkingData.EnrolmentRequest(0).AltPostcodeOut = ""
            WorkingData.EnrolmentRequest(0).AltPostcodeIn = ""
        End If
    End Sub

    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        ' Response.Write(WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1)

        'Store custom field values in session
        Session("RadioButtonListAlt") = RadioButtonListAlt.SelectedValue.ToString


        Me.Page.Validate()

        If Me.Page.IsValid Then

            WorkingData.EnrolmentRequestRow.Surname = Trim(fldSurname.Value.ToString)
            WorkingData.EnrolmentRequestRow.FirstForename = Trim(fldFirstName.Value.ToString)

            If ddCollegeAccomodation.SelectedValue = "1" Then
                WorkingData.EnrolmentRequestRow.AccommodationTypeID = "11"
            End If

            WorkingData.EnrolmentRequest(0).Address1 = fldAddress1.Value
            WorkingData.EnrolmentRequest(0).Address2 = fldAddress2.Value
            WorkingData.EnrolmentRequest(0).Address3 = fldAddress3.Value
            WorkingData.EnrolmentRequest(0).Address4 = fldAddress4.Value

            'postcode stuff            
            ''CCCPS-77326: Setting flag to false so Main Address screen opens when coming from this page.
            PSWebEnrolmentProperties.IsCurrentlyTakingAltAddress = False
            If Len(postcode.Value.Trim) > 0 Then
                WorkingData.EnrolmentRequestRow.PostcodeOut = postcode.Value.Trim.Substring(0, postcode.Value.Trim.Length - 3).Trim
                WorkingData.EnrolmentRequestRow.PostcodeIn = Right(postcode.Value.Trim, 3).Trim

                WorkingData.ApplicationRequestRow.PostcodeOut = postcode.Value.Trim.Substring(0, postcode.Value.Trim.Length - 3).Trim
                WorkingData.ApplicationRequestRow.PostcodeIn = Right(postcode.Value.Trim, 3).Trim
            End If

            If Len(AltPostcode.Value.Trim) > 0 Then
                WorkingData.EnrolmentRequestRow.AltPostcodeOut = AltPostcode.Value.Trim.Substring(0, AltPostcode.Value.Trim.Length - 3).Trim
                WorkingData.EnrolmentRequestRow.AltPostcodeIn = Right(AltPostcode.Value.Trim, 3).Trim

                WorkingData.ApplicationRequestRow.AltPostcodeOut = AltPostcode.Value.Trim.Substring(0, AltPostcode.Value.Trim.Length - 3).Trim
                WorkingData.ApplicationRequestRow.AltPostcodeIn = Right(AltPostcode.Value.Trim, 3).Trim
            End If

            Response.Redirect(GetResourceValue("checkout_parentguardian_1618_aspx"))


            End If

    End Sub


    Protected Sub btnBack_Click(sender As Object, e As EventArgs) Handles btnBack.Click

    End Sub
End Class
Partial Class courseenrol
    Inherits webenrolmentcontrolvalidate

    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If
        End Get
    End Property

End Class

