Option Explicit On
Option Strict On
Imports System.Drawing
Imports CompassCC.CCCSystem.CCCCommon
Imports System.Drawing.Imaging
Imports System.IO
Imports System.Linq
Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports System.Globalization

Partial Class checkout_applications
    Inherits CheckoutBaseControl

    Public OfferingID As Integer
    Public Course As Course

    Protected Overrides Sub RenderChildren(writer As HtmlTextWriter)
        MyBase.RenderChildren(writer)
    End Sub

    Public Overrides Sub RenderControl(writer As HtmlTextWriter)
        MyBase.RenderControl(writer)

    End Sub

    Public Is19Plus As Boolean
    Public Date31stAug As Date
    Public DateIsAdult As Date

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)

        OfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(OfferingID)

        'Check age to see if 19+ fields should be displayed
        Date31stAug = CDate(Today().Year & "-08-31")
        DateIsAdult = Date31stAug.AddYears(-19)

        If WorkingData.ApplicationRequestRow.DateOfBirth < DateIsAdult Then
            Is19Plus = True
        Else
            Is19Plus = False
        End If

        'Ensure correct options are selected on custom form elements if page has values already
        Dim euroResidentAnswer = Request.Form("ctl00$MainContentPlaceholder$ctl00$EuroResident")

        'Re-select the selected option on submit
        If Len(euroResidentAnswer) > 0 Then
            EuroResident.Items.FindByValue(euroResidentAnswer).Selected = True
        End If

        Dim ehcpAnswer = Request.Form("ctl00$MainContentPlaceholder$ctl00$EHCPYN")

        If ehcpAnswer = "Y" Then
            EHCPYN.Items.FindByValue("Y").Selected = True
        ElseIf ehcpAnswer = "N" Then
            EHCPYN.Items.FindByValue("N").Selected = True
        End If

        If PaymentSubmitter.AllowEmptyBasket And WorkingData.ShoppingCart.Items.Count = 0 Then
            Session("RequestMode") = RequestMode.ApplicationRequest
        End If

        If Not IsPostBack Then

        End If
    End Sub

    Public Overrides Sub ValidateControl()
        If Not IsNothing(fldCriminalConvictionID) Then
            If IsNothing(fldCriminalConvictionID.Value) Then
                fldCriminalConvictionIDValidator.ErrorMessage = "Please select whether you have any criminal convictions"
                fldCriminalConvictionIDValidator.IsValid = False
                fldCriminalConvictionIDValidator.CssClass = "error alert alert-danger"
                fldCriminalConvictionID.CssClass = "ErrorInput"
            End If
        End If

        If Not IsNothing(fldLearningDiffOrDisID) Then
            If IsNothing(fldLearningDiffOrDisID.Value) Then
                fldLearningDiffOrDisIDValidator.ErrorMessage = "Please select whether you have a learning difficulty and/or disability"
                fldLearningDiffOrDisIDValidator.IsValid = False
                fldLearningDiffOrDisIDValidator.CssClass = "error alert alert-danger"
                fldLearningDiffOrDisID.CssClass = "ErrorInput"
            ElseIf CInt(fldLearningDiffOrDisID.Value) = 1 And IsNothing(fldDisabilityCategory1ID.Value) Then
                fldLearningDiffOrDisIDValidator.ErrorMessage = "As you have stated you have a learning difficulty and/or disability, please state what this so we can support you"
                fldLearningDiffOrDisIDValidator.IsValid = False
                fldLearningDiffOrDisIDValidator.CssClass = "error alert alert-danger"
                fldLearningDiffOrDisID.CssClass = "ErrorInput"
            End If
        End If

        If Not IsNothing(ALSRequestedYN) Then
            If ALSRequestedYN.SelectedItem.Value.Length <> 1 Then
                ALSRequestedYNValidator.ErrorMessage = "Please select whether you consider yourself to have special educational needs"
                ALSRequestedYNValidator.IsValid = False
                ALSRequestedYNValidator.CssClass = "error alert alert-danger"
                ALSRequestedYN.CssClass = "ErrorInput"
            End If
        End If

        If Not IsNothing(EHCPYN) Then
            If EHCPYN.SelectedItem.Value.Length <> 1 Then
                EHCPYNValidator.ErrorMessage = "Please select whether you have an Educational Healthcare Plan to help support your educational, health and social needs"
                EHCPYNValidator.IsValid = False
                EHCPYNValidator.CssClass = "error alert alert-danger"
                EHCPYN.CssClass = "ErrorInput"
            End If
        End If

        If Not IsNothing(CareLeaverYN) Then
            If CareLeaverYN.SelectedItem.Value.Length <> 1 Then
                CareLeaverYNValidator.ErrorMessage = "Please select whether you are in or have you recently left Local Authority Care"
                CareLeaverYNValidator.IsValid = False
                CareLeaverYNValidator.CssClass = "error alert alert-danger"
                CareLeaverYN.CssClass = "ErrorInput"
            End If
        End If

        If Not IsNothing(EuroResident) Then
            If EuroResident.SelectedItem.Value = "-- Please Select --" And Is19Plus = True Then
                EuroResidentValidator.ErrorMessage = "Please select your residency status as you will be aged 19+ on " + DateIsAdult.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture)
                EuroResidentValidator.IsValid = False
                EuroResidentValidator.CssClass = "error alert alert-danger"
                EuroResident.CssClass = "ErrorInput"
            ElseIf EuroResident.SelectedItem.Value = "EEANationalEEA" And CInt(fldHomeFeeEligibilityID.Value) < 1 Then
                EuroResidentValidator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> Please confirm if you have settled or pre-settled status"
                EuroResidentValidator.IsValid = False
                EuroResidentValidator.CssClass = "error alert alert-danger"
                EuroResident.CssClass = "ErrorInput"
            End If
        End If

        'If Not IsNothing(fldEthnicGroupID) Then
        '    If IsNothing(fldEthnicGroupID.Value) Then
        '        fldEthnicGroupIDValidator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> Please select your ethnicity"
        '        fldEthnicGroupIDValidator.IsValid = False
        '        fldEthnicGroupIDValidator.CssClass = "error alert alert-danger"
        '        fldEthnicGroupID.CssClass = "ErrorInput"
        '    End If
        'End If

        MyBase.ValidateControl()
    End Sub


    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then

        End If
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
