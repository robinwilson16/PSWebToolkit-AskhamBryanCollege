Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class webcontrols_checkout_enrolments
    Inherits CheckoutBaseControl

    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)
        WorkingData.EnrolmentRequestRow.DateOfBirth = "08/09/1996"
    End Sub



    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()

        Session("age") = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), CType("01/08/2020", Date)) / 365.25)
        If Not Session("startdate") Is Nothing Then Session("agecourse") = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), CType(Session("startdate"), Date)) / 365.25)


    End Sub

End Class
