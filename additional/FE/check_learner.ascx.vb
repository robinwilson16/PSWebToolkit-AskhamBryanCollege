
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports Microsoft.VisualBasic.ApplicationServices
Imports System.Data
Imports PdfSharp.Pdf.Content.Objects
Imports CommandType = System.Data.CommandType
Imports System.Data.SqlClient

Partial Class webcontrols_check_learner
    Inherits CheckoutBaseControl

    Public OfferingID As Integer
    Public Course As Course
    Public ReferenceDate As Date
    Public ConsentDate As Date
    Public HasSearched As Boolean = False
    Public IsADuplicate As Boolean = False
    Public TimesApplied As Integer = 0
    Public FormCssClass As String = ""

    Protected Overrides Sub OnLoad(e As EventArgs)

        OfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(OfferingID)

        ReferenceDate = CDate(Today().Year & "-08-31")
        ConsentDate = ReferenceDate.AddYears(-18)

        If IsPostBack Then
            Me.Page.Validate()

            If Me.Page.IsValid Then
                HasSearched = True
                FormCssClass = "d-none"

                'Populate Post Code into Web Enrolment Fields
                If Len(postcode.Value.Trim) > 0 Then
                    WorkingData.EnrolmentRequestRow.PostcodeOut = postcode.Value.Trim.Substring(0, postcode.Value.Trim.Length - 3).Trim
                    WorkingData.EnrolmentRequestRow.PostcodeIn = Right(postcode.Value.Trim, 3).Trim

                    WorkingData.ApplicationRequestRow.PostcodeOut = postcode.Value.Trim.Substring(0, postcode.Value.Trim.Length - 3).Trim
                    WorkingData.ApplicationRequestRow.PostcodeIn = Right(postcode.Value.Trim, 3).Trim
                End If

                'Populate Other Fields
                WorkingData.EnrolmentRequestRow.FirstForename = Trim(fldFirstForename.Value.ToString)
                WorkingData.ApplicationRequestRow.FirstForename = Trim(fldFirstForename.Value.ToString)

                WorkingData.EnrolmentRequestRow.Surname = Trim(fldSurname.Value.ToString)
                WorkingData.ApplicationRequestRow.Surname = Trim(fldSurname.Value.ToString)

                WorkingData.EnrolmentRequestRow.DateOfBirth = CDate(fldDateOfBirth.Value)
                WorkingData.ApplicationRequestRow.DateOfBirth = CDate(fldDateOfBirth.Value)

                'Load Enrolment Requests
                Dim tblEnrolmentRequests As New EnrolmentRequestDataTable
                Dim vEnrolmentRequests As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblEnrolmentRequests)
                vEnrolmentRequests.Columns.AddPKColumns()
                vEnrolmentRequests.Columns.EnsureColumnsAreSelected(True, False, tblEnrolmentRequests.SurnameColumn, tblEnrolmentRequests.FirstForenameColumn, tblEnrolmentRequests.DateOfBirthColumn, tblEnrolmentRequests.PostcodeOutColumn, tblEnrolmentRequests.PostcodeInColumn)
                'vEnrolmentRequests.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

                'Find Matches
                vEnrolmentRequests.Filters.SetColumnFilter(tblEnrolmentRequests.OfferingIDColumn, OfferingID, FilterOperator.OperatorEquals)
                vEnrolmentRequests.Filters.SetColumnFilter(tblEnrolmentRequests.SurnameColumn, WorkingData.EnrolmentRequestRow.Surname, FilterOperator.OperatorEquals)
                vEnrolmentRequests.Filters.SetColumnFilter(tblEnrolmentRequests.FirstForenameColumn, WorkingData.EnrolmentRequestRow.FirstForename, FilterOperator.OperatorEquals)
                vEnrolmentRequests.Filters.SetColumnFilter(tblEnrolmentRequests.DateOfBirthColumn, WorkingData.EnrolmentRequestRow.DateOfBirth, FilterOperator.OperatorEquals)
                vEnrolmentRequests.Filters.SetColumnFilter(tblEnrolmentRequests.PostcodeOutColumn, WorkingData.EnrolmentRequestRow.PostcodeOut, FilterOperator.OperatorEquals)
                vEnrolmentRequests.Filters.SetColumnFilter(tblEnrolmentRequests.PostcodeInColumn, WorkingData.EnrolmentRequestRow.PostcodeIn, FilterOperator.OperatorEquals)

                tblEnrolmentRequests.TableAdapter.Load(tblEnrolmentRequests, vEnrolmentRequests)

                'If matches found then learner has already applied for this course
                If tblEnrolmentRequests.Count > 0 Then
                    TimesApplied = tblEnrolmentRequests.Count
                    IsADuplicate = True
                End If
            End If

        Else
            postcode.Value = WorkingData.EnrolmentRequestRow.PostcodeOut + WorkingData.EnrolmentRequestRow.PostcodeIn
        End If

        MyBase.OnLoad(e)
    End Sub

    Protected Overrides Sub CreateChildControls()
        MyBase.CreateChildControls()

    End Sub

    Public Overrides Sub ValidateControl()

        'Forename (Single Name Only)
        If Not IsNothing(fldFirstForename) And Not IsNothing(fldFirstForename.Value) Then
            If Not String.IsNullOrEmpty(fldFirstForename.Value.ToString()) Then
                If (fldFirstForename.Value.ToString().Contains(" ")) Then
                    fldFirstForenameValidator.ErrorMessage = "Forename or Given Name must only contain your first name with no spaces. Please Enter Any middle names into the Other Forenames (Middle Names) box below."
                    fldFirstForenameValidator.IsValid = False
                    fldFirstForenameValidator.CssClass = "error alert alert-danger"
                    fldFirstForename.CssClass = "ErrorInput"
                End If
            End If
        End If

        'DOB
        If Not IsNothing(fldDateOfBirth) Then
            Dim dateOfBirthDate As Date?

            If Not String.IsNullOrEmpty(fldDateOfBirth.Value) Then
                dateOfBirthDate = CType(fldDateOfBirth.Value, Date)
            End If

            Dim dateToCheckDOB As Date = CDate(Today().Year & "-08-31")
            Dim minAllowedDOB As Date = dateToCheckDOB.AddYears(-16)
            Dim maxAllowedDOB As Date = dateToCheckDOB.AddYears(-70)

            If String.IsNullOrEmpty(fldDateOfBirth.Value) Then
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

        MyBase.ValidateControl()
    End Sub

    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        Response.Redirect(GetResourceValue("checkout_enrolments_FE_aspx"))

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

