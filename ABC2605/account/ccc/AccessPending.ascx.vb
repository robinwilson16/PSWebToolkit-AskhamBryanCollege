Imports CompassCC.CCCSystem.CCCCommon
Imports System.Net.Mail
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class account_ccc_AccessPending
    Inherits webenrolmentcontrolvalidate


    Protected Sub btnResendCode_Click(sender As Object, e As EventArgs) Handles btnResendCode.Click

        CCCCheck.CheckNotNothing(Request.Form("pre[email]"), "Email")
        Dim row As WebUserRow = WebUserDataTable.FindUserRow(Request.Form("pre[email]"))

        If Not row Is Nothing Then
            If row.VerificationStatusID = 1 Then
                Dim v As New CustomValidator()
                v.ErrorMessage = "Account already verified, please log in to continue."
                v.IsValid = False
                Me.Page.Validators.Add(v)
                Me.ValidationSummary1.ShowSummary = True

                Exit Sub
            End If

            row.VerificationCode = Guid.NewGuid
            row.VerificationStatusID = 0
            row.Table.TableAdapter.Save(row.Table)

            Dim WebMail As New SmtpClient("")
            Dim mailMessage As New MailMessage()
            mailMessage.[To].Add(Request.Form("pre[email]"))

            mailMessage.Subject = "Email Verification Requested"
            mailMessage.Body = String.Format("Please click this code to verify your email address: {0}", ResolveUrl(Me.Context.Request.Url.Scheme & "://" & Me.Context.Request.Url.Authority & Replace(Me.Context.Request.ApplicationPath, "/", "") & "/webenrolment.aspx?page=~/account/ccc/EmailVerification.ascx&Email=" & Request.Form("pre[email]") & "&vc=" & row.VerificationCode.ToString))

            WebMail.Send(mailMessage)
            altSuccess.Visible = True
        Else
            Dim v As New CustomValidator()
            v.ErrorMessage = "User not found. Please try to register again."
            v.IsValid = False
            Me.Page.Validators.Add(v)
            Me.ValidationSummary1.ShowSummary = True
        End If
    End Sub
End Class
