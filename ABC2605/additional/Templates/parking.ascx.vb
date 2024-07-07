Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports System.IO
Imports System.Drawing.Imaging
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class parking
    Inherits CheckoutBaseControl



    Protected Overrides Sub OnLoad(e As EventArgs)

        MyBase.OnLoad(e)



    End Sub



    Public Overrides Sub ValidateControl()




    End Sub


    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        If Me.Page.IsValid Then
            Response.Redirect(GetResourceValue("checkout_makepayment_aspx"))
        End If

    End Sub



End Class
