Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports System.Web.UI
Imports System.Linq
''' <summary>
''' CCCPS-75837: A sample step to depict integration of new Attachemnt option for user to upload data against Enrolment and Application requests.
''' </summary>
Partial Class webcontrols_checkout_attachments
    Inherits CheckoutBaseControl

    Public OfferingID As Integer
    Public Course As Course
    Public IsAttachmentRequired As Boolean = True
    Public UploadButtonClicked As Boolean = False
    Public HasSelectedEvidenceType As Boolean = True
    Public FileIsValid As Boolean = False

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

        OfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(OfferingID)

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
        Dim validExtensions As String() = {".jpg", ".jpeg", ".png", ".gif", ".bmp", ".heic", ".pdf", ".doc", ".docx"}

        FileChosen.Text = "N" 'Reset back to No
        UploadButtonClicked = True


        If HasSelectedEvidenceType = True Then
            Me.fuAttachment.ValidateFile()

            Dim rowAttachment = WorkingData.EnrolmentRequestAttachments.NewRow
            _lastAttachmentID -= 1
            With rowAttachment

                Dim ValidatorAppend As String = .TypeOfEvidence
                .AttachmentID = _lastAttachmentID
                .TypeOfEvidence = ddlTypeOfEvidence.SelectedValue
                .Notes = txtNotes.Text.Trim
                .Attachment = fuAttachment.FileBytes
                .FileName = fuAttachment.FileName
                .Size = fuAttachment.FileBytes.Length
                hiddenvalidator.Value = (hiddenvalidator.Value + ValidatorAppend)
                ''test.Text = (ddlTypeOfEvidence.SelectedValue)

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

            'Check Image is Valid
            If Not IsNothing(rowAttachment.FileName) Then
                If String.IsNullOrEmpty(rowAttachment.FileName) Then
                    ddlTypeOfEvidenceValidator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> Please upload your photo by clicking on Choose File"
                    ddlTypeOfEvidenceValidator.IsValid = False
                    ddlTypeOfEvidenceValidator.CssClass = "error alert alert-danger"
                    fuAttachment.Attributes.Add("Class", "textfield form-control ErrorInput")
                ElseIf rowAttachment.FileName.LastIndexOf(".") <= 0 Then
                    ddlTypeOfEvidenceValidator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> This type of file is not valid. Please upload a valid image file"
                    ddlTypeOfEvidenceValidator.IsValid = False
                    ddlTypeOfEvidenceValidator.CssClass = "error alert alert-danger"
                    fuAttachment.Attributes.Add("Class", "textfield form-control ErrorInput")
                ElseIf validExtensions.Contains(rowAttachment.FileName.Substring(rowAttachment.FileName.LastIndexOf(".")).ToLower) = False Then
                    ddlTypeOfEvidenceValidator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> This type of file is not valid. Please upload a valid image file"
                    ddlTypeOfEvidenceValidator.IsValid = False
                    ddlTypeOfEvidenceValidator.CssClass = "error alert alert-danger"
                    fuAttachment.Attributes.Add("Class", "textfield form-control ErrorInput")
                Else
                    WorkingData.EnrolmentRequestAttachments.AddRow(rowAttachment)
                    FileIsValid = True
                    'Redirecting to self instead of just resetting controls to avoid issue of attachment being added on browser refresh.
                    Response.Redirect(GetResourceValue("checkout_attachments_HE_aspx"))
                End If
            End If
        End If

        'trNoItems.Visible = False
        'Me.Page.Validate()
        ''Following line is important to perform validations on File Upload control based on setup done on control.
        'Me.fuAttachment.ValidateFile()

        'If Not Me.Page.IsValid Then
        '    Return
        'End If

        'If ddlTypeOfEvidence.SelectedValue = "" Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Please select Type of Evidence for the file you are uploading"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        '    Exit Sub
        'End If

        'Dim validExtensions As String() = {".jpg", ".jpeg", ".png", ".gif", ".bmp", ".heic, .pdf, .doc, .docx"}
        'If Not IsNothing(fuAttachment) Then
        '    'If String.IsNullOrEmpty(PhotoPath.Value) And IsPhotoRequired = True Then
        '    '    PhotoPathValidator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> Please upload your photo by clicking on Choose File"
        '    '    PhotoPathValidator.IsValid = False
        '    '    PhotoPathValidator.CssClass = "error alert alert-danger"
        '    '    FileUpload1.Attributes.Add("Class", "textfield form-control ErrorInput")
        '    'End If
        '    If fuAttachment.FileName.ToString.Length = 0 Then
        '        'Do Nothing
        '    ElseIf fuAttachment.FileName.ToString.LastIndexOf(".") <= 0 Then
        '        FilePathValidator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> This type of file is not valid. Please upload a valid file"
        '        FilePathValidator.IsValid = False
        '        FilePathValidator.CssClass = "error alert alert-danger"
        '        fuAttachment.Attributes.Add("Class", "textfield form-control ErrorInput")
        '    ElseIf validExtensions.Contains(fuAttachment.FileName.ToString.Substring(fuAttachment.FileName.ToString.LastIndexOf(".")).ToLower) = False Then
        '        FilePathValidator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> This type of file is not valid. Please upload a valid file"
        '        FilePathValidator.IsValid = False
        '        FilePathValidator.CssClass = "error alert alert-danger"
        '        fuAttachment.Attributes.Add("Class", "textfield form-control ErrorInput")
        '    End If
        'End If

        'Dim rowAttachment = WorkingData.EnrolmentRequestAttachments.NewRow
        '_lastAttachmentID -= 1
        'With rowAttachment

        '    Dim ValidatorAppend As String = .TypeOfEvidence
        '    .AttachmentID = _lastAttachmentID
        '    .TypeOfEvidence = ddlTypeOfEvidence.SelectedValue
        '    ' .Notes = txtNotes.Text.Trim
        '    .Attachment = fuAttachment.FileBytes
        '    .FileName = fuAttachment.FileName
        '    .Size = fuAttachment.FileBytes.Length
        '    hiddenvalidator.Value = (hiddenvalidator.Value + ValidatorAppend)
        '    If CCCAttachmentThumbnailGenerator.FilenameIndicatesFileIsCompatibleImage(fuAttachment.FileName) Then
        '        Try
        '            .ImageThumb = CCCAttachmentThumbnailGenerator.CreateThumbnailAsByteArray(.Attachment, 96)
        '        Catch ex As Exception
        '            ' Cannot create thumb nail- ignore error
        '            .ImageThumb = Nothing ' No thumb-nail
        '        End Try
        '    End If
        '    .CreatedDate = DateTime.Now
        'End With
        'WorkingData.EnrolmentRequestAttachments.AddRow(rowAttachment)
        ''Redirecting to self instead of just resetting controls to avoid issue of attachment being added on browser refresh.

        'Response.Redirect(GetResourceValue("checkout_attachments_HE_aspx"))
    End Sub

    ''' <summary>
    ''' Binding Attachment table to repeater to display already uploaded attachments to user.
    ''' </summary>
    Private Sub loadAttachments()
        rptAttachments.DataSource = WorkingData.EnrolmentRequestAttachments
        rptAttachments.DataBind()
        If (WorkingData.EnrolmentRequestAttachments.Rows.Count = 0) Then
            'trNoItems.Visible = True
        Else
            'trNoItems.Visible = False
        End If
    End Sub

    Public Function displayNotesIcon(notes As String) As Boolean
        If Len(notes) > 0 Then
            Return True
        Else
            Return False
        End If

    End Function

    Public Overrides Sub ValidateControl()

        'Type of Evidence
        If Not IsNothing(ddlTypeOfEvidence) And UploadButtonClicked = True Then
            If ddlTypeOfEvidence.SelectedValue = "" Then
                ddlTypeOfEvidenceValidator.ErrorMessage = "Please select Type of Evidence for the file you are uploading"
                ddlTypeOfEvidenceValidator.IsValid = False
                ddlTypeOfEvidenceValidator.CssClass = "error alert alert-danger"
                ddlTypeOfEvidence.CssClass = "ErrorInput"

                HasSelectedEvidenceType = False
                Return
            End If
        End If

        If UploadButtonClicked = False Then
            'File picked but upload not pressed
            If Not IsNothing(btnUpload) Then
                If FileChosen.Text = "Y" Then
                    btnUploadValidator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> Please press Upload once you have picked a file before pressing Next"
                    btnUploadValidator.IsValid = False
                    btnUploadValidator.CssClass = "error alert alert-danger"
                    'btnUpload.CssClass = "ErrorInput"
                End If
            End If


            'File Validation
            Dim validExtensions As String() = {".jpg", ".jpeg", ".png", ".gif", ".bmp", ".heic", ".pdf", ".doc", ".docx"}

            If Not IsNothing(StudentDetailUserDefined25) Then
                If WorkingData.EnrolmentRequestAttachments.Count = 0 And (CType(StudentDetailUserDefined25.Value, String) = "" Or CType(StudentDetailUserDefined25.Value, String) = "OK") And IsAttachmentRequired = True Then
                    FilePathValidator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> Please upload your attachment/s by clicking on Choose File. If you cannot upload your attachment/s then please state the reason why."
                    FilePathValidator.IsValid = False
                    FilePathValidator.CssClass = "error alert alert-danger"
                    fuAttachment.Attributes.Add("Class", "textfield form-control ErrorInput")
                End If
            Else
                If WorkingData.EnrolmentRequestAttachments.Count = 0 And IsAttachmentRequired = True Then
                    FilePathValidator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> Please upload your attachment/s by clicking on Choose File. If you cannot upload your attachment/s then please state the reason why."
                    FilePathValidator.IsValid = False
                    FilePathValidator.CssClass = "error alert alert-danger"
                    fuAttachment.Attributes.Add("Class", "textfield form-control ErrorInput")
                End If
            End If
        End If

        ''Example of Attachemts not empty validation 


        'If trNoItems.Visible = True Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "You have not uploaded any attachments!"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If
        ''Dim rowToDelete = WorkingData.EnrolmentRequestAttachments.evid(attachmentID)

        'Response.Write(hiddenvalidator.Value)
        'Example of Validation for Evidence Type - proof od ID
        'If Not (hiddenvalidator.Value.ToString.Contains("Proof")) Then
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


            Response.Redirect(GetResourceValue("checkout_photo_1618_aspx"))

        End If




    End Sub


    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click


        Response.Redirect(GetResourceValue("checkout_employment_1618_aspx"))



    End Sub

End Class
