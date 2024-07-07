Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports System.Data
Imports System.Net.Mail

Partial Class account_ccc_Register
    Inherits webenrolmentcontrolvalidate

    Public Overrides Sub ValidateControl()
        MyBase.ValidateControl()


    End Sub

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click

        ValidateControl()

        If Me.Page.IsValid Then
            Dim tblWebUser As WebUserDataTable = WorkingData.WebUser
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblWebUser)
            v.Columns.AddDBColumns(False, False)
            v.Filters.SetColumnFilter(tblWebUser.EmailColumn, Request.Form("pre[email]"))
            tblWebUser.TableAdapter.Load(tblWebUser, v)

            If tblWebUser.Rows.Count = 1 Then
                'User already exists
                Dim v2 As New CustomValidator()
                v2.ErrorMessage = "User already exists."
                v2.IsValid = False
                Me.Page.Validators.Add(v2)

                Me.ValidationSummary1.ShowSummary = True
            Else
                'Create user
                Dim row As WebUserRow = tblWebUser.NewRowWithDefaults
                row.Email = Request.Form("pre[email]").ToLower
                row.Password = CCCAuthenticationLibrary.EncryptPassword(Request.Form("password"))
                row.Surname = Request.Form("pre[surname]")
                row.FirstForename = Request.Form("pre[firstname]")
                row.Title = Request.Form("pre[title]")
                row.Sex = Request.Form("pre[sex]")
                If Request.Form("pre[dateofbirth]").Length > 0 Then
                    row.DateOfBirth = Request.Form("pre[dateofbirth]")
                End If
                row.Address1 = Request.Form("pre[address1]")
                row.Address2 = Request.Form("pre[address2]")
                row.Address3 = Request.Form("pre[address3]")
                row.Address4 = Request.Form("pre[address4]")
                Dim pcode As String = Request.Form("pre[postalcode]")
                'postcode stuff            
                If Len(pcode) > 0 Then
                    Try
                        row.PostcodeOut = Left(pcode.Substring(0, pcode.Length - 3), 4).Trim
                        row.PostcodeIn = Right(pcode, 3).Trim
                    Catch ex As Exception
                        Dim v2 As New CustomValidator()
                        v2.ErrorMessage = "Please enter a valid postcode."
                        v2.IsValid = False
                        Me.Page.Validators.Add(v2)

                        Me.ValidationSummary1.ShowSummary = True
                        Exit Sub
                    End Try
                End If

                tblWebUser.Rows.Add(row)

                If SystemSettings.ShouldVerifyEmail Then
                    tblWebUser.TableAdapter.Save(tblWebUser)
                    GenerateVerificationEmail(row.Email)
                Else
                    row.VerificationStatusID = 1
                    tblWebUser.TableAdapter.Save(tblWebUser)
                    'WorkingData.CurrentLoggedOnUserRow = row
                    Response.Redirect(GetResourceValue("AccountCreated"))
                End If
            End If


        End If
    End Sub


    Private Sub GenerateVerificationEmail(Email As String)

        CCCCheck.CheckNotNothing(Email, "Email")
        Dim row As WebUserRow = WebUserDataTable.FindUserRow(Email)
        row.VerificationCode = Guid.NewGuid
        row.VerificationStatusID = 0
        row.Table.TableAdapter.Save(row.Table)

        Dim WebMail As New SmtpClient("")
        Dim mailMessage As New MailMessage()
        mailMessage.[To].Add(Email)
        mailMessage.Subject = "Email Verification Requested"
        mailMessage.Body = String.Format("Please click this code to verify your email address: {0}", ResolveUrl(Me.Context.Request.Url.Scheme & "://" & Me.Context.Request.Url.Authority & Replace(Me.Context.Request.ApplicationPath, "/", "") & "/webenrolment.aspx?page=~/account/ccc/EmailVerification.ascx&Email=" & Server.UrlEncode(Email) & "&vc=" & Server.UrlEncode(row.VerificationCode.ToString)))

        WebMail.Send(mailMessage)

        Response.Redirect(GetResourceValue("PendingVerification"))
    End Sub
End Class
