Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports Microsoft.VisualBasic.ApplicationServices
Imports System.Data
Imports PdfSharp.Pdf.Content.Objects
Imports CommandType = System.Data.CommandType
Imports System.Data.SqlClient

Partial Class checkout_dataprotection
    Inherits CheckoutBaseControl

    Public OfferingID As Integer
    Public Course As Course

    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        OfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(OfferingID)

        If WorkingData.EnrolmentRequestRow.SentMarketingInfo = True Then
            selectStayingInTouch.SelectedValue = "1"
        End If

        Dim p As New PaymentSubmitter

    End Sub

    Public Overrides Sub ValidateControl()

        If Not IsNothing(selectStayingInTouch) Then
            If selectStayingInTouch.SelectedValue = "" Then
                selectStayingInTouchValidator.ErrorMessage = "Staying in touch cannot be blank."
                selectStayingInTouchValidator.IsValid = False
                selectStayingInTouchValidator.CssClass = "error alert alert-danger"
                selectStayingInTouch.CssClass = "ErrorInput"
            End If
        End If

        If Not IsNothing(selectSMSConsent) Then
            If selectSMSConsent.SelectedValue = "" Then
                selectSMSConsentValidator.ErrorMessage = "Please confirm you consent to the use of SMS."
                selectSMSConsentValidator.IsValid = False
                selectSMSConsentValidator.CssClass = "error alert alert-danger"
                selectSMSConsent.CssClass = "ErrorInput"
            End If
        End If

        If Not IsNothing(chkConfirm) Then
            If Not chkConfirm.Checked = True Then
                chkConfirmValidator.ErrorMessage = "Please confirm that you have read the declaration above."
                chkConfirmValidator.IsValid = False
                chkConfirmValidator.CssClass = "error alert alert-danger"
                chkConfirm.CssClass = "ErrorInput"
            End If
        End If

        MyBase.ValidateControl()
    End Sub

    Private Sub CheckData()

        WorkingData.EnrolmentRequestRow.SentMarketingInfo = selectStayingInTouch.SelectedValue

    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        ValidateControl()

        If Me.Page.IsValid Then

            WorkingData.EnrolmentRequestRow.SentMarketingInfo = selectStayingInTouch.SelectedValue
            If selectSMSConsent.SelectedValue = "1" Then
                WorkingData.EnrolmentRequestRow.CanBeContactBySMS = True
            End If
            'used to store age but now clear them down
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = ""
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = ""
            ''to avoid going to payment provider, no fees for 1618
            Dim item As New ShoppingCartItem()
            With WorkingData.ShoppingCart
                If Not .Items.Contains(item) Then
                    item.Cost = 0
                End If
            End With
            Server.Transfer(GetResourceValue("checkout_makepayment_aspx"))

        End If

    End Sub

End Class
