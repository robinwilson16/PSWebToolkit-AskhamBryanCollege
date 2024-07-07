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

        If selectStayingInTouch.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Staying in touch cannot be blank."
            v.IsValid = False
            Me.Page.Validators.Add(v)
            selectStayingInTouch.Style.Add("border", "1px solid red")
        End If

        If selectSMSConsent.SelectedValue = "" Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please confirm you consent to the use of SMS."
            v.IsValid = False
            Me.Page.Validators.Add(v)
            selectSMSConsent.Style.Add("border", "1px solid red")
        End If

        If Not chkConfirm.Checked Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please confirm that you have read the declaration above."
            v.IsValid = False
            Me.Page.Validators.Add(v)
            chkConfirm.Style.Add("border", "1px solid red")

        End If


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
