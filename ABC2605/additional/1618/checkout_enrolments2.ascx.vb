

Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit


Partial Class webcontrols_checkout_enrolments2
    Inherits CheckoutBaseControl

    Protected Overrides Sub OnLoad(e As EventArgs)
        'Response.Write(WorkingData.EnrolmentRequestRow.StudentDetailUserDefined58)
        'If Not Session("agecourse") Is Nothing Then lblAgeCourse.Text = CType("Your age on " & Session("startdate") & ": " & Session("agecourse") & " (" & Session("ageGroup"), String) & ")"

        If Not IsPostBack Then
            If Session("dis") <> "" Then selectLearnDiff.SelectedValue = Session("dis")
        End If

        ' postcode.Value = WorkingD ata.EnrolmentRequestRow.PostcodeOut & WorkingData.EnrolmentRequestRow.PostcodeIn

        MyBase.OnLoad(e)
    End Sub

    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        Session("dis") = selectLearnDiff.SelectedValue

        If Session("dis") <> "" Then WorkingData.EnrolmentRequestRow.LearningDiffOrDisID = Session("dis")

        If Me.Page.IsValid Then

            Response.Redirect(GetResourceValue("checkout_quals_on_entry_1618_aspx"))

        End If

    End Sub
    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click

        ' Me.Page.Validate()

        Session("dis") = selectLearnDiff.SelectedValue
        If Session("dis") <> "" Then WorkingData.EnrolmentRequestRow.LearningDiffOrDisID = Session("dis")

        Response.Redirect(GetResourceValue("checkout_parentguardian_1618_aspx"))

        'End If

    End Sub

    Public Overrides Sub ValidateControl()
        'Response.Write(selectEuro.SelectedValue)
        If selectLearnDiff.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please answer the question 'Do you consider that you have a learning difficulty, disability or health condition?"
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If
        If selectLearnDiff.SelectedValue = "1" And CType("" & WorkingData.EnrolmentRequestRow.DisabilityCategory1ID, String) = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please provide a primary learning / disabilities' "
            v.IsValid = False
            Me.Page.Validators.Add(v)
        End If




        MyBase.ValidateControl()
    End Sub

    Public Overrides Sub RenderControl(writer As HtmlTextWriter)
        ' Move UK to top of Nationality Drop Down
        Dim ctlNationality As DropDownList = TryCast(StudentEnrolmentField1.InternalFieldControl, DropDownList)
        Dim ctlResidence As DropDownList = TryCast(StudentEnrolmentField2.InternalFieldControl, DropDownList)
        Dim ctlEthnicity As DropDownList = TryCast(fldEthnicGroupID.InternalFieldControl, DropDownList)

        Dim itemGB = ctlNationality.Items.FindByValue("GB") ' United Kingdom
        Dim itemXF = ctlResidence.Items.FindByValue("XF") ' UK
        Dim ItemEng = ctlEthnicity.Items.FindByValue("31")

        ctlEthnicity.Items.Remove(ItemEng)
        ctlEthnicity.Items.Insert(1, ItemEng)

        ctlResidence.Items.Remove(itemXF)
        ctlResidence.Items.Insert(1, itemXF)


        ctlNationality.Items.Remove(itemGB)
        ctlNationality.Items.Insert(1, itemGB)

        MyBase.RenderControl(writer)

    End Sub
End Class


