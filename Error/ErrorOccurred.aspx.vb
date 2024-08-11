Imports Elmah

Partial Class ErrorOccurred
    Inherits System.Web.UI.Page

    Public ImageTooLarge As Boolean = False
    Public StatusCode As String

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        StatusCode = Request.QueryString("StatusCode")

        If Not IsPostBack Then
            Try

                'Show the error type on screen
                lblErrorType.Text = "Error:" + StatusCode

                'Only try to get the referring page if there is one
                If Request.UrlReferrer IsNot Nothing Then
                    lblErrorPage.Text = Request.UrlReferrer.PathAndQuery.ToString
                End If
                lblErrorMessage.Text = "Sorry an unexpected error has occurred whilst processing your request. Please press the Go Back button to try again."

                'Add Check To See If Image Was Too Large To Redirect Back
                If StatusCode = "413" Then
                    ImageTooLarge = True
                    lblErrorMessage.Text = "Sorry the image you tried to upload was too large. Please press the Go Back button and select a file that is less than 10MB."
                End If

                'catch any errors that might be caused by the error page itself
            Catch ex As Exception
                lblErrorType.Text = "Unknown Error Occurred and Unable To Show Details"
                lblErrorPage.Text = HttpUtility.HtmlEncode(Request.UrlReferrer.PathAndQuery.ToString)
                lblErrorMessage.Text = "An error occurred but it was not possible to determine the cause of this error. Please go back and try again."
            End Try
        End If
    End Sub
End Class