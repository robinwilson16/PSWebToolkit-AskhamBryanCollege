Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class account_ccc_Logout
    Inherits webenrolmentcontrolvalidate



    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        WorkingData.WebUser.Clear()
        If SystemSettings.SaveForLater Then
            WorkingData.EnrolmentRequest.Clear()
            WorkingData.EnrolmentRequestHE.Clear()
            WorkingData.EnrolmentRequestQualsOnEntry.Clear()
            WorkingData.EnrolmentRequestEmploymentHistory.Clear()
            WorkingData.EnrolmentRequestAttachments.Clear()
            WorkingData.ApplicationRequest.Clear()
            WorkingData.ApplicationRequestHE.Clear()
            WorkingData.ApplicationRequestQualsOnEntry.Clear()

            WorkingData.ApplicationRequestEmploymentHistory.Clear()
            WorkingData.ApplicationRequestAttachments.Clear()
            WorkingData.ShoppingCart.Items.Clear()
        End If
        WorkingData.TriggerSaveForLaterOnNextLoad = False
        WorkingData.SaveForLaterInObject = WorkingData.SaveForLaterObjects.All
        Response.Redirect(GetResourceValue("search_aspx"))
    End Sub
End Class
