Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class checkout_dataprotection_apponly
    Inherits CheckoutBaseControl

    Public OfferingID As Integer
    Public Course As Course

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)

        OfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(OfferingID)
    End Sub

    Public Overrides Sub ValidateControl()

        'I agree checkbox
        If Not IsNothing(chkConfirm) Then
            If Not chkConfirm.Checked Then
                chkConfirmValidator.ErrorMessage = "Please confirm that you have read the declaration above"
                chkConfirmValidator.IsValid = False
                chkConfirmValidator.CssClass = "error alert alert-danger"
                chkConfirm.CssClass = "ErrorInput"
            End If
        End If
    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click
        Me.Page.Validate()

        If Me.Page.IsValid Then

            Server.Transfer(GetResourceValue("makepayment_abc"))
        End If

    End Sub

End Class
