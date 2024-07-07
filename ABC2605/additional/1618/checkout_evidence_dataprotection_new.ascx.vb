Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class checkout_evidence_dataprotection_new
    Inherits CheckoutBaseControl


    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

    End Sub

    Public Overrides Sub ValidateControl()

        'If StudentSignature.Signature Is Nothing Then

        '    Dim v As New CustomValidator()
        '    v.ErrorMessage = "Please complete your signature."
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)

        '    Me.ValidationSummary1.ShowSummary = True

        'Else
        '    WorkingData.EnrolmentRequestRow.StudentSignature = StudentSignature.Signature

        'End If
        If Not chkConfirm.Checked Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please confirm that you have read the declaration above."
            v.IsValid = False
            Me.Page.Validators.Add(v)

            Me.ValidationSummary1.ShowSummary = True
        End If
    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        ValidateControl()

        If Me.Page.IsValid Then
            Server.Transfer(GetResourceValue("checkout_makepayment_aspx"))
        End If

    End Sub

End Class
