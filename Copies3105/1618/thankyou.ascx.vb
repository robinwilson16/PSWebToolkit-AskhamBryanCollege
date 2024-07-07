Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports System.Net.Mail
Imports System.Data
Imports PdfSharp.Pdf.Content.Objects
Imports CommandType = System.Data.CommandType
Imports System.Data.SqlClient


Partial Class thankyou
    Inherits webenrolmentcontrolvalidate

    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        Dim fname As String = ""
        Dim submitted As String = ""


        Dim WebMail As New SmtpClient("")
        Dim mailMessage As New MailMessage()
        Dim StringMessage As String
        Dim college As String = "the College"

        If Not Session("college") Is Nothing Then
            If Session("college") <> "" Then college = Session("college")
        End If

        If WorkingData.EnrolmentRequestRow.Email <> "" And Session("email_sent") = "" Then

                'still logged in
                Dim SQLDBDataReader As SqlClient.SqlDataReader
                Dim SQLDataTable As New DataTable
                Dim cmd As New SqlCommand
                Dim SQLCmd As New SqlClient.SqlConnection
                SQLCmd.ConnectionString = GetConn()
                SQLCmd.Open()
                cmd.CommandText = "PSWebenrolmentReports.dbo.spGetStudentDetailsByEmail"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Connection = SQLCmd
                cmd.Parameters.AddWithValue("email", WorkingData.EnrolmentRequestRow.Email)
                SQLDBDataReader = cmd.ExecuteReader()

                If SQLDBDataReader.HasRows Then
                    While (SQLDBDataReader.Read)
                        fname = CStr(SQLDBDataReader("firstforename"))
                        submitted = CStr(SQLDBDataReader("email_submitted"))  ''are the already in the enrolment request?
                    End While
                End If
                If submitted = "Y" And Session("email_sent") = "" Then
                    StringMessage = "Hi " + fname + "<br />"
                    StringMessage += "Thank you for submiting your details to  " + college + ".<br />"
                    StringMessage += "We will now verify the information you have submitted and will send you a formal Learning Agreement, which is your contract of learning with the college, to sign as soon as the verification process has been completed. <br /><br />"
                    StringMessage += "If you have any questions In the meantime, please visit our website for further information:<br />"
                    StringMessage += "<ol>"
                    StringMessage += "<li><a href=""https://www.hartlepoolsixth.ac.uk/experience/enrolment/"" target=""_self"">Hartlepool Sixth Form Enrolment</a></li>"
                    StringMessage += "<li><a href=""https//www.northumberland.ac.uk/experience/enrolment/"" target=""_self"">Northumberland College Enrolment</a></li>"
                    StringMessage += "<li><a href=""https://www.sunderlandcollege.ac.uk/experience/enrolment/"" target=""_self"">Sunderland College Enrolment</a></li>"
                    StringMessage += "</ol>"
                    StringMessage += "Yours sincerely,<br />"
                    StringMessage += "Vikkie Morton<br />"
                    StringMessage += "Vice Principal Students Services & Registry"

                    mailMessage.[To].Add((WorkingData.EnrolmentRequestRow.Email))
                    mailMessage.From = New MailAddress("noreply@educationpartnershipne.ac.uk")
                    mailMessage.IsBodyHtml = True

                    mailMessage.Subject = "Thank you for submitting your online enrolment form for " + Session("college")
                    mailMessage.Body = StringMessage
                    'mailMessage.Body = String.Format("Please click this code to reset your password: {0}", ResolveUrl(Me.Context.Request.Url.Scheme + "://" + Me.Context.Request.Url.Authority + Replace(Me.Context.Request.ApplicationPath, "/", "") + "/webenrolment.aspx?page=~/account/ccc/DoPasswordReset.ascx&Email=" & Request.Form("pre[email]") & "&vc=" & row.VerificationCode.ToString))
                    WebMail.Send(mailMessage)
                    Session("email_sent") = "Y"
                End If
            End If

    End Sub



End Class
