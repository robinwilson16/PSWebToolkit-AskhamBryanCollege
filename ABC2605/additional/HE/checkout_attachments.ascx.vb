Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports System.Web.UI
''' <summary>
''' CCCPS-75837: A sample step to depict integration of new Attachemnt option for user to upload data against Enrolment and Application requests.
''' </summary>
Partial Class webcontrols_checkout_attachments
    Inherits CheckoutBaseControl
    ''' <summary>
    ''' To keep last uploaded file id. This will be needed to delete attachment.
    ''' </summary>
    ''' <returns>_lastAttachmentID</returns>
    Private Property _lastAttachmentID() As Integer
        Get
            Return CInt(HttpContext.Current.Session("LastAttachmentID"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("LastAttachmentID") = value
        End Set
    End Property
    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)
        'Response.Write("----" + WorkingData.EnrolmentRequestEmploymentHistory(0).EmploymentStatusID)
        'Response.Write(WorkingData.EnrolmentRequestRow.StudentDetailUserDefined42)
        'Clear class attributes first
        Me.divMain.Attributes("class") = ""
        If Not IsPostBack Then
            loadAttachments()
        End If
        '    If Session("euro") = "2" Then liEuro.Visible = True
        '     If Session("employerpays") = "Yes" Then lisponsor.Visible = True
        '   If Session("evidenceless") = "Yes" Then liearnlessevidence.Visible = True
        '   If Session("asylum") = "Yes" Then liasylum.Visible = True
    End Sub
    ''' <summary>
    ''' To remove attachment on click of remove button against particular attachment.
    ''' </summary>
    ''' <param name="source">source</param>
    ''' <param name="e">e</param>
    Protected Sub rptAttachments_ItemCommand(source As Object, e As RepeaterCommandEventArgs)
        If (e.CommandName = "RemoveAttachment") Then
            Dim attachmentID = CCCDataTypeConverter.Convert(Of Integer)(e.CommandArgument)
            Dim rowToDelete = WorkingData.EnrolmentRequestAttachments.FindByAttachmentID(attachmentID)
            If (rowToDelete IsNot Nothing) Then
                WorkingData.EnrolmentRequestAttachments.RemoveRow(rowToDelete)
                loadAttachments()
            End If
        End If
    End Sub

    ''' <summary>
    ''' Save attachment in in-memory data table which we will be using to save in final step of the wizard.
    ''' </summary>
    ''' <param name="sender">sender</param>
    ''' <param name="e">e</param>
    Private Sub btnUpload_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpload.Click



        trNoItems.Visible = False
        Me.Page.Validate()
        ''Following line is important to perform validations on File Upload control based on setup done on control.
        Me.fuAttachment.ValidateFile()

        If Not Me.Page.IsValid Then
            Return
        End If
        If ddlTypeOfEvidence.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please select Type of Evidence for the file you are uploading"
            v.IsValid = False
            Me.Page.Validators.Add(v)
            Return
        End If
        Dim rowAttachment = WorkingData.EnrolmentRequestAttachments.NewRow
        _lastAttachmentID -= 1
        With rowAttachment

            Dim ValidatorAppend As String = .TypeOfEvidence
            .AttachmentID = _lastAttachmentID
            .TypeOfEvidence = ddlTypeOfEvidence.SelectedValue
            ' .Notes = txtNotes.Text.Trim
            .Attachment = fuAttachment.FileBytes
            .FileName = fuAttachment.FileName
            .Size = fuAttachment.FileBytes.Length
            hiddenvalidator.Value = (hiddenvalidator.Value + ValidatorAppend)
            If CCCAttachmentThumbnailGenerator.FilenameIndicatesFileIsCompatibleImage(fuAttachment.FileName) Then
                Try
                    .ImageThumb = CCCAttachmentThumbnailGenerator.CreateThumbnailAsByteArray(.Attachment, 96)
                Catch ex As Exception
                    ' Cannot create thumb nail- ignore error
                    .ImageThumb = Nothing ' No thumb-nail
                End Try
            End If
            .CreatedDate = DateTime.Now
        End With
        WorkingData.EnrolmentRequestAttachments.AddRow(rowAttachment)
        ''Redirecting to self instead of just resetting controls to avoid issue of attachment being added on browser refresh.

        Response.Redirect(GetResourceValue("checkout_attachments_HE_aspx"))
    End Sub

    ''' <summary>
    ''' Binding Attachment table to repeater to display already uploaded attachments to user.
    ''' </summary>
    Private Sub loadAttachments()
        rptAttachments.DataSource = WorkingData.EnrolmentRequestAttachments
        rptAttachments.DataBind()
        If (WorkingData.EnrolmentRequestAttachments.Rows.Count = 0) Then
            trNoItems.Visible = True
        Else
            trNoItems.Visible = False
        End If
    End Sub

    Public Overrides Sub ValidateControl()

        ''Example of Attachemts not empty validation 


        'If trNoItems.Visible = True Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "You have not uploaded any attachments!"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If
        ' Response.Write(hiddenvalidator.Value)
        ''Example of Validation for Evidence Type - proof od ID
        'If Not (hiddenvalidator.Value.ToString.Contains("Proof of Identity")) Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Please upload proof of your identity"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If

        ''Example of Validation for Evidence Type - based on EU/UK
        'If Not (hiddenvalidator.Value.ToString.Contains("Residence")) AndAlso Session("euro") = "2" Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Please upload proof of your Residence Status"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If

        'If Not (hiddenvalidator.Value.ToString.Contains("Salary")) AndAlso Session("evidenceless") = "Yes" Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Please Upload your salary evidence"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If

        'If Not (hiddenvalidator.Value.ToString.Contains("Sponsor")) AndAlso Session("employerpays") = "Yes" Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Please Upload your sponsor letter"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If


        MyBase.ValidateControl()
    End Sub


    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        Me.Page.Validate()
        If Me.Page.IsValid Then


            Response.Redirect(GetResourceValue("checkout_photo_HE_aspx"))

        End If




    End Sub


    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click


        Response.Redirect(GetResourceValue("checkout_employment_HE_aspx"))



    End Sub

End Class
