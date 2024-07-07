
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports Microsoft.VisualBasic.ApplicationServices
Imports System.Data
Imports PdfSharp.Pdf.Content.Objects
Imports CommandType = System.Data.CommandType
Imports System.Data.SqlClient

Partial Class webcontrols_checkout_enrolments
    Inherits CheckoutBaseControl


    Protected Overrides Sub OnLoad(e As EventArgs)

        If IsPostBack Then
            '   UpdateAddress()
        Else
            postcode.Value = WorkingData.EnrolmentRequestRow.PostcodeOut + WorkingData.EnrolmentRequestRow.PostcodeIn
            Postcode1.Value = WorkingData.EnrolmentRequestRow.AltPostcodeOut + WorkingData.EnrolmentRequestRow.AltPostcodeIn

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
    Public Overrides Sub ValidateControl()

        If Len(txtAddress1.Value) = 0 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must enter the 1st line of the address"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        If Len(postcode.Value) = 0 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Postcode must not be blank"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        Dim regexPostCode As New Regex("^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$")
        Dim match As Match = regexPostCode.Match(postcode.Value)
        If Not match.Success Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please enter a valid Postcode"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If


        If WorkingData.EnrolmentRequestRow.MobileTel = "" And WorkingData.EnrolmentRequestRow.Tel = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please enter at least one phone number (Mobile number / Home phone (inc. STD code))."
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If

        If RadioButtonListAlt.SelectedValue = "" Then
            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Is your term time address different to your home address? must not be blank"
            Me.Page.Validators.Add(a)
            RadioButtonListAlt.Style.Add("border", "1px solid red")
        End If

        Dim startDate As Date = "02/09/2023"
        Dim refDate As Date = "31/08/2023"

        If Not WorkingData.EnrolmentRequestRow.StudentDetailUserDefined14 Is Nothing Then
            If IsDate(WorkingData.EnrolmentRequestRow.StudentDetailUserDefined14) Then
                startDate = CType(WorkingData.EnrolmentRequestRow.StudentDetailUserDefined14, Date)
            End If
        End If
        If IsDate(WorkingData.EnrolmentRequestRow.DateOfBirth) Then
            ' Session("age") = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), refDate) / 365.25)
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), refDate) / 365.25)
            If IsDate(startDate) Then
                'Session("agecourse") = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), startDate) / 365.25)
                WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), startDate) / 365.25)
            End If
        End If

        MyBase.ValidateControl()
    End Sub



    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        ' Response.Write(WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1)
        Me.Page.Validate()

        If Me.Page.IsValid Then

            WorkingData.EnrolmentRequest(0).Address1 = txtAddress1.Value
            WorkingData.EnrolmentRequest(0).Address2 = txtAddress2.Value
            WorkingData.EnrolmentRequest(0).Address3 = txtAddress3.Value
            WorkingData.EnrolmentRequest(0).Address4 = txtAddress4.Value

            Dim pcode As String = Replace(postcode.Value, " ", "")
            If Len(pcode) > 0 Then

                'avoid dodgy postcodes breaking system
                Try
                    WorkingData.EnrolmentRequestRow.PostcodeOut = pcode.Substring(0, pcode.Length - 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.EnrolmentRequestRow.PostcodeOut = ""
                End Try

                Try
                    WorkingData.EnrolmentRequestRow.PostcodeIn = Right(pcode, 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.EnrolmentRequestRow.PostcodeIn = ""
                End Try

            End If

            Dim pcode1 As String = Replace(Postcode1.Value, " ", "")
            If Len(pcode1) > 0 Then

                'avoid dodgy postcodes breaking system
                Try
                    WorkingData.EnrolmentRequestRow.AltPostcodeOut = pcode1.Substring(0, pcode1.Length - 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.EnrolmentRequestRow.AltPostcodeOut = ""
                End Try

                Try
                    WorkingData.EnrolmentRequestRow.AltPostcodeIn = Right(pcode1, 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.EnrolmentRequestRow.AltPostcodeIn = ""
                End Try

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

