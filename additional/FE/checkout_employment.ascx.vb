Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon

Partial Class webcontrols_checkout_employment
    Inherits CheckoutBaseControl

    Public OfferingID As Integer
    Public AcademicYearID As String
    Public Course As Course

    Public Is19Plus As Boolean
    Public Date31stAug As Date
    Public DateIsAdult As Date
    Public Is19PlusOutsideAreaConfirmed As Boolean

    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        OfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(OfferingID)
        AcademicYearID = Course.AcademicYear
        Is19PlusOutsideAreaConfirmed = CBool(Session("19PlusOutsideAreaConfirmed"))

        'Check age to see if 19+ fields should be displayed
        Date31stAug = CDate(Today().Year & "-08-31")
        DateIsAdult = Date31stAug.AddYears(-19)

        If WorkingData.ApplicationRequestRow.DateOfBirth < DateIsAdult Then
            Is19Plus = True
        Else
            Is19Plus = False
        End If

        If Not (IsPostBack) Then

            If WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentStatusID <> "" Then
                selectEmployed.SelectedValue = WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentStatusID
            End If
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentIntensityID <> "" Then
                selectEmploymentIntensity.SelectedValue = WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentIntensityID
            End If
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfEmploymentID <> "" Then
                selectEmploymentLength.SelectedValue = WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfEmploymentID
            End If
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfUnemploymentID <> "" Then
                selectLengthUnemployed.SelectedValue = WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfUnemploymentID
            End If
            ' If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined43 = "True" Then chkOtherStateBen.checked = True
            ' If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined43 = "False" Then chkOtherStateBen.Checked = False


            If WorkingData.EnrolmentRequestEmploymentHistoryRow.IsSelfEmployed Then
                rdoSelfEmp.SelectedValue = 1
            Else
                rdoSelfEmp.SelectedValue = 0
            End If

        End If

        If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined10 = "Y" Then
            chkLowWage.Checked = True
        End If

    End Sub

    Public Overrides Sub RenderControl(writer As HtmlTextWriter)

        'Show older guidance for learners enrolling to current year rather than next year
        If AcademicYearID <= "25/26" Then
            chkLowWage.Text = "Tick this box if you earn less than &pound;25,750 per year in gross pay"
            lblLowWageThreshold.Text = "&pound;25,750"
        End If

        MyBase.RenderControl(writer)
    End Sub

    Public Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then


            WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentStatusID = selectEmployed.SelectedValue
            WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentIntensityID = selectEmploymentIntensity.SelectedValue
            WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfEmploymentID = selectEmploymentLength.SelectedValue
            WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfUnemploymentID = selectLengthUnemployed.SelectedValue


            If rdoSelfEmp.SelectedValue.ToString.Length > 0 Then
                WorkingData.EnrolmentRequestEmploymentHistoryRow.IsSelfEmployed = rdoSelfEmp.SelectedValue
            End If

            If Not IsNothing(chkLowWage) Then
                If chkLowWage.Checked = True Then
                    WorkingData.EnrolmentRequestRow.StudentDetailUserDefined10 = "Y"
                End If
            End If


            Response.Redirect(GetResourceValue("checkout_attachments_FE_aspx"))

        End If
    End Sub

    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click


        Response.Redirect(GetResourceValue("checkout_quals_on_entry_FE_aspx"))


    End Sub


    Public Overrides Sub ValidateControl()
        If selectEmployed.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please tell us your employment status"
            v.IsValid = False
            Me.Page.Validators.Add(v)
            selectEmployed.Style.Add("border", "1px solid red")
        End If

        If selectEmployed.SelectedValue = "11" Or selectEmployed.SelectedValue = "12" Then
            If selectLengthUnemployed.SelectedValue = "" Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Length of of time unemployed must be provided"
                v.IsValid = False
                Me.Page.Validators.Add(v)
                selectLengthUnemployed.Style.Add("border", "1px solid red")
            End If

        End If
        If selectEmployed.SelectedValue = "10" Then
            If selectEmploymentIntensity.SelectedValue = "" Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Hours per week must be provided"
                v.IsValid = False
                Me.Page.Validators.Add(v)
                selectEmploymentIntensity.Style.Add("border", "1px solid red")
            End If

            If selectEmploymentLength.SelectedValue = "" Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Length of time in employment must be provided"
                v.IsValid = False
                Me.Page.Validators.Add(v)
                selectEmploymentLength.Style.Add("border", "1px solid red")
            End If

            If Not IsDate(WorkingData.EnrolmentRequestEmploymentHistoryRow.DateFrom) Then
                Dim v As New CustomValidator
                v.ErrorMessage = "Employment from date must be provided"
                v.IsValid = False
                Me.Page.Validators.Add(v)
            End If

            'Employed check for EII and LOE and SelfEmp
            If Not (rdoSelfEmp.SelectedValue = "1" Or rdoSelfEmp.SelectedValue = "0") Then
                Dim a As New CustomValidator
                a.IsValid = False
                a.ErrorMessage = "If you are Employed, are you self employed?"
                Me.Page.Validators.Add(a)
                ValidationSummary.CssClass = "error"
            End If

        End If
        MyBase.ValidateControl()
    End Sub

End Class
