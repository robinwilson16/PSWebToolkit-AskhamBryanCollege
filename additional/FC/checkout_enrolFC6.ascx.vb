Option Explicit Off
Option Strict Off
Imports System.Collections.Generic
Imports System.Drawing
Imports System.IO
Imports System.Linq
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class checkout_directapply
    Inherits webenrolmentcontrolvalidate

    Public MainOfferingID As Integer
    Public Course As Course
    Public IsAttachmentRequired As Boolean = True
    Public UploadButtonClicked As Boolean = False
    Public HasSelectedEvidenceType As Boolean = True
    Public FileIsValid As Boolean = False

    Public tblOffering As New OfferingDataTable

    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering1ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering1ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering1ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering2ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering2ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering2ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering3ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering3ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering3ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering4ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering4ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering4ID"))
            End If
        End Get
    End Property
    Public ReadOnly Property Offering5ID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("Offering5ID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("Offering5ID"))
            End If
        End Get
    End Property


    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)

        MainOfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(MainOfferingID)

        If WorkingData.ApplicationRequestRow.AcceptMarketingConsent = True Then
            rdoConsent.SelectedValue = "1"
        End If

        ddlTypeOfEvidence.SelectedIndex = 1



        'divAdult.Visible = False

        'If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 <> "" Then
        '    If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 > 18 Then
        '        divAdult.Visible = True
        '    End If
        'End If

        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined10 <> "" Then
            whopays.SelectedValue = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined10
        End If

        If WorkingData.EnrolmentRequestRow.EnrolmentUserDefined11 <> "" Then
            howpay.SelectedValue = WorkingData.EnrolmentRequestRow.EnrolmentUserDefined11
        End If

        If Not IsPostBack Then

            loadAttachments()

            PutAllOfferingsInBasket()
            PopulateOfferingFeeTable()

        End If





    End Sub



    ''Put offerings in basket
    Protected Sub PutAllOfferingsInBasket()

        Dim IntOffering1ID As Integer = Me.Offering1ID
        If IntOffering1ID <> -1 Then

            Dim tblOffering1 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering1)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering1.WebSiteAvailabilityIDColumn, tblOffering1.CourseInformationIDColumn, tblOffering1.TotalFeeAmountColumn, tblOffering1.OfferingTypeIDColumn, tblOffering1.CollegeLevelUserDefined1Column)
            v.Filters.SetColumnFilter(tblOffering1.OfferingIDColumn, IntOffering1ID)
            tblOffering1.TableAdapter.Load(tblOffering1, v)

            If tblOffering1.Count > 0 AndAlso tblOffering1(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering1(0)


                    'item.Cost = .TotalFeeAmount.Value


                    item.Description = .GetRowDescription



                    item.ItemType = "Enrolment"

                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)

                    End If
                End With

            End If
        End If

        Dim IntOffering2ID As Integer = Me.Offering2ID

        If IntOffering2ID <> -1 Then

            Dim tblOffering2 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering2)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering2.WebSiteAvailabilityIDColumn, tblOffering2.CourseInformationIDColumn, tblOffering2.TotalFeeAmountColumn, tblOffering2.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering2.OfferingIDColumn, IntOffering2ID)
            tblOffering2.TableAdapter.Load(tblOffering2, v)



            If tblOffering2.Count > 0 AndAlso tblOffering2(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering2(0)

                    '   item.Cost = 0


                    item.Description = .GetRowDescription



                    item.ItemType = "Enrolment"

                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault


                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With

            End If
        End If
        Dim IntOffering3ID As Integer = Me.Offering3ID

        If IntOffering3ID <> -1 Then

            Dim tblOffering3 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering3)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering3.WebSiteAvailabilityIDColumn, tblOffering3.CourseInformationIDColumn, tblOffering3.TotalFeeAmountColumn, tblOffering3.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering3.OfferingIDColumn, IntOffering3ID)
            tblOffering3.TableAdapter.Load(tblOffering3, v)


            If tblOffering3.Count > 0 AndAlso tblOffering3(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering3(0)


                    '      item.Cost = 0


                    item.Description = .GetRowDescription



                    item.ItemType = "Enrolment"

                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With

            End If
        End If

        Dim IntOffering4ID As Integer = Me.Offering4ID

        If IntOffering4ID <> -1 Then

            Dim tblOffering4 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering4)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering4.WebSiteAvailabilityIDColumn, tblOffering4.CourseInformationIDColumn, tblOffering4.TotalFeeAmountColumn, tblOffering4.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering4.OfferingIDColumn, IntOffering4ID)
            tblOffering4.TableAdapter.Load(tblOffering4, v)

            If tblOffering4.Count > 0 AndAlso tblOffering4(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering4(0)


                    '    item.Cost = 0


                    item.Description = .GetRowDescription



                    item.ItemType = "Enrolment"

                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault


                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With

            End If
        End If
        Dim IntOffering5ID As Integer = Me.Offering5ID

        If IntOffering5ID <> -1 Then

            Dim tblOffering5 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering5)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering5.WebSiteAvailabilityIDColumn, tblOffering5.CourseInformationIDColumn, tblOffering5.TotalFeeAmountColumn, tblOffering5.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering5.OfferingIDColumn, IntOffering5ID)
            tblOffering5.TableAdapter.Load(tblOffering5, v)



            If tblOffering5.Count > 0 AndAlso tblOffering5(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering5(0)

                    '       item.Cost = 0


                    item.Description = .GetRowDescription



                    item.ItemType = "Enrolment"

                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With

            End If
        End If




        Dim intOfferingID As Integer = Me.OfferingID
        If intOfferingID <> -1 Then

            Dim tblOffering As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.CourseInformationIDColumn, tblOffering.TotalFeeAmountColumn, tblOffering.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, intOfferingID)
            tblOffering.TableAdapter.Load(tblOffering, v)



            If tblOffering.Count > 0 AndAlso tblOffering(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering(0)

                    'sorry about that    item.Cost = 0


                    item.Description = .GetRowDescription



                    item.ItemType = "Enrolment"

                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With
            End If
        End If



    End Sub

    Public Overrides Sub RenderControl(writer As HtmlTextWriter)



        MyBase.RenderControl(writer)

    End Sub

    ''Bring in the Fees
    Protected Sub PopulateOfferingFeeTable()
        'Load all offerings in the shopping basket
        Dim stb As New System.Text.StringBuilder
        For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
            If stb.Length > 0 Then stb.Append(",")
            stb.Append(item.OfferingID)


        Next
        If stb.Length > 0 Then
            'Load offerings
            'Dim tblOffering As New OfferingDataTable
            Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblOffering)
            vOffering.Columns.AddPKColumns()
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn, tblOffering.SIDColumn, tblOffering.WebSiteAvailabilityIDColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

            tblOffering.TableAdapter.Load(tblOffering, vOffering)



            'Me.GridView1.DataSource = tblOffering
            'Me.GridView1.DataBind()
            'Me.GridView1.Visible = True


        End If
    End Sub

    ''Databind the Grid
    'Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound

    '    If e.Row.RowType = DataControlRowType.DataRow Then

    '        Dim OfferingID As Integer = CInt(DataBinder.Eval(e.Row.DataItem, "OfferingID"))

    '    End If
    'End Sub

    Public Function displayNotesIcon(notes As String) As Boolean
        If Len(notes) > 0 Then
            Return True
        Else
            Return False
        End If

    End Function

    Public Overrides Sub ValidateControl()

        'If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 <> "" Then
        '    If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 > 18 Then
        '        If rdoAdult.Checked = "" Then
        '            Dim a As New CustomValidator
        '            a.IsValid = False
        '            a.ErrorMessage = "Please confirm you acknowledge fees may be applicable as you are over 19."
        '            Me.Page.Validators.Add(a)
        '            rdoAdult.Style.Add("border", "1px solid red")
        '        End If
        '    End If
        'End If

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

        If rdoConsent.SelectedValue = "" Then
            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "After you enrol, we would like to send you details of services the College has to offer to support your study and your time here at the College. However, you can unsubscribe from those emails at any time must not be blank"
            Me.Page.Validators.Add(a)
            rdoConsent.Style.Add("border", "1px solid red")
        End If

        If whopays.SelectedValue = "" Then
            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Please tell us who is paying must not be blank"
            Me.Page.Validators.Add(a)
            whopays.Style.Add("border", "1px solid red")
        End If

        If howpay.SelectedValue = "" Then
            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Please tell us how do you intend to pay must not be blank"
            Me.Page.Validators.Add(a)
            howpay.Style.Add("border", "1px solid red")
        End If

        If Not chkConfirm.Checked Then
            Dim v As New CustomValidator
            v.IsValid = False
            v.ErrorMessage = "Please confirm the declaration"
            Me.Page.Validators.Add(v)
            chkConfirm.Style.Add("border", "1px solid red")
        End If

        MyBase.ValidateControl()
    End Sub



    Public Property intCurrentQuals() As Integer
        Get
            Return CInt(HttpContext.Current.Session("intQualRows"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("intQualRows") = value
        End Set
    End Property


    Protected Overrides Sub CreateChildControls()
        MyBase.CreateChildControls()



    End Sub

    Public Property intCurrentReferences() As Integer
        Get
            Return CInt(HttpContext.Current.Session("intReferenceRows"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("intReferenceRows") = value
        End Set
    End Property


    'Private Sub loadAttachments()
    '    rptAttachments.DataSource = WorkingData.EnrolmentRequestAttachments
    '    rptAttachments.DataBind()
    '    If (WorkingData.EnrolmentRequestAttachments.Rows.Count = 0) Then
    '        trNoItems.Visible = True
    '    Else
    '        trNoItems.Visible = False
    '    End If
    'End Sub




    Private Sub CheckData()

        WorkingData.ApplicationRequestRow.AcceptMarketingConsent = rdoConsent.SelectedValue
        WorkingData.EnrolmentRequestRow.EnrolmentUserDefined10 = whopays.SelectedValue
        WorkingData.EnrolmentRequestRow.EnrolmentUserDefined11 = howpay.SelectedValue


    End Sub



    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click


        Dim redirectString As String = String.Empty

        Me.Page.Validate()


        If Me.Page.IsValid Then


            CheckData()


            redirectString = GetResourceValue("checkout_makepayment_aspx")
            Response.Redirect(redirectString)

        End If



    End Sub


    Protected Sub btnBack_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnBack.Click


        Dim redirectString As String = String.Empty

        'Me.Page.Validate()


        'If Me.Page.IsValid Then


        CheckData()


        redirectString = GetResourceValue("checkout_enrolFC5_aspx")
            Response.Redirect(redirectString)

        'End If



    End Sub

    'Private Sub btnUpload_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpload.Click
    '    Page.MaintainScrollPositionOnPostBack = True
    '    'trNoItems.Visible = False
    '    'upload.Visible = True
    '    'Me.Page.Validate()
    '    ''Following line is important to perform validations on File Upload control based on setup done on control.
    '    Me.fuAttachment.ValidateFile()

    '    'If Not Me.Page.IsValid Then
    '    '    Return
    '    'End If


    '    Dim rowAttachment = WorkingData.EnrolmentRequestAttachments.NewRow
    '    _lastAttachmentID -= 1
    '    With rowAttachment
    '        .AttachmentID = _lastAttachmentID
    '        .TypeOfEvidence = (ddlTypeOfEvidence.SelectedValue & System.DateTime.Now)
    '        '.Notes = txtNotes.Text.Trim
    '        .Attachment = fuAttachment.FileBytes
    '        .FileName = fuAttachment.FileName
    '        .Size = fuAttachment.FileBytes.Length
    '        If CCCAttachmentThumbnailGenerator.FilenameIndicatesFileIsCompatibleImage(fuAttachment.FileName) Then
    '            Try
    '                .ImageThumb = CCCAttachmentThumbnailGenerator.CreateThumbnailAsByteArray(.Attachment, 96)
    '            Catch ex As Exception
    '                ' Cannot create thumb nail- ignore error
    '                .ImageThumb = Nothing ' No thumb-nail
    '            End Try
    '        End If
    '        .CreatedDate = DateTime.Now
    '    End With
    '    WorkingData.EnrolmentRequestAttachments.AddRow(rowAttachment)
    '    ''Reload attachments to refresh the grid and clear the controls for user to do fresh entry again.
    '    loadAttachments()
    '    'txtNotes.Text = Nothing
    '    ddlTypeOfEvidence.SelectedIndex = 0
    'End Sub

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

    Private Sub loadAttachments()
        rptAttachments.DataSource = WorkingData.EnrolmentRequestAttachments
        rptAttachments.DataBind()
        'If (WorkingData.EnrolmentRequestAttachments.Rows.Count = 0) Then
        'trNoItems.Visible = True
        'Else
        'trNoItems.Visible = False
        'End If
    End Sub

    Private Property _lastAttachmentID() As Integer
        Get
            Return CInt(HttpContext.Current.Session("LastAttachmentID"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("LastAttachmentID") = value
        End Set
    End Property
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

End Class
