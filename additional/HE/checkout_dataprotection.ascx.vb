Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
Imports Microsoft.VisualBasic.ApplicationServices
Imports System.Data
Imports PdfSharp.Pdf.Content.Objects
Imports CommandType = System.Data.CommandType
Imports System.Data.SqlClient

Partial Class checkout_dataprotection
    Inherits CheckoutBaseControl

    Public OfferingID As Integer
    Public Course As Course
    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        OfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(OfferingID)

        If WorkingData.EnrolmentRequestRow.SentMarketingInfo = True Then
            selectStayingInTouch.SelectedValue = "1"
        End If

        If Not IsPostBack Then
            '   loadAttachments()
            PopulateOfferingFeeTable()
        End If

        Dim p As New PaymentSubmitter

        'Dim rowAttachment = WorkingData.EnrolmentRequestAttachment
        'WorkingData.EnrolmentRequestAttachments.TypeOfEvidence
        ''_lastAttachmentID -= 1
        'With rowAttachment

        '    ' Response.Write(WorkingData.EnrolmentRequestAttachments.) ' = ddlTypeOfEvidence.SelectedValue

        'End With
        ' If Session("euro") = "2" Then divEuro.Visible = True
        If PaymentSubmitter.AllowEmptyBasket And WorkingData.ShoppingCart.Items.Count = 0 Then

            Session("RequestMode") = RequestMode.EnrolmentRequest

        End If



    End Sub

    Public Overrides Sub ValidateControl()

        If selectStayingInTouch.SelectedValue = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Staying in touch cannot be blank."
            v.IsValid = False
            Me.Page.Validators.Add(v)
            selectStayingInTouch.Style.Add("border", "1px solid red")
        End If

        If selectSMSConsent.SelectedValue = "" Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please confirm you consent to the use of SMS."
            v.IsValid = False
            Me.Page.Validators.Add(v)
            selectSMSConsent.Style.Add("border", "1px solid red")
        End If

        If Not chkConfirm.Checked Then
            Dim v As New CustomValidator()
            v.ErrorMessage = "Please confirm that you have read the declaration above."
            v.IsValid = False
            Me.Page.Validators.Add(v)
            chkConfirm.Style.Add("border", "1px solid red")
        End If

    End Sub

    Private Sub CheckData()

        WorkingData.EnrolmentRequestRow.SentMarketingInfo = selectStayingInTouch.SelectedValue

    End Sub

    Protected Sub btnContinue_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnContinue.Click

        ValidateControl()

        If Me.Page.IsValid Then

            WorkingData.EnrolmentRequestRow.SentMarketingInfo = selectStayingInTouch.SelectedValue

            If selectSMSConsent.SelectedValue = "1" Then
                WorkingData.EnrolmentRequestRow.CanBeContactBySMS = True
            End If

            'used to store age but now clear them down
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = ""
                WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = ""
                ''to avoid going to payment provider, no fees for 1618
                Dim item As New ShoppingCartItem()
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        item.Cost = 0
                    End If
                End With
                Server.Transfer(GetResourceValue("checkout_makepayment_aspx"))

            End If

    End Sub

    'Private Property _lastAttachmentID() As Integer
    '    Get
    '        Return CInt(HttpContext.Current.Session("LastAttachmentID"))
    '    End Get
    '    Set(ByVal value As Integer)
    '        HttpContext.Current.Session("LastAttachmentID") = value
    '    End Set
    'End Property


    'Protected Sub rptAttachments_ItemCommand(source As Object, e As RepeaterCommandEventArgs)
    '    If (e.CommandName = "RemoveAttachment") Then
    '        Dim attachmentID = CCCDataTypeConverter.Convert(Of Integer)(e.CommandArgument)
    '        Dim rowToDelete = WorkingData.EnrolmentRequestAttachments.FindByAttachmentID(attachmentID)
    '        If (rowToDelete IsNot Nothing) Then
    '            WorkingData.EnrolmentRequestAttachments.RemoveRow(rowToDelete)
    '            loadAttachments()
    '        End If
    '    End If
    'End Sub

    'Private Sub btnUpload_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpload.Click



    '    trNoItems.Visible = False
    '    Me.Page.Validate()
    '    ''Following line is important to perform validations on File Upload control based on setup done on control.
    '    Me.fuAttachment.ValidateFile()

    '    If Not Me.Page.IsValid Then
    '        Return
    '    End If
    '    If ddlTypeOfEvidence.SelectedValue = "" Then
    '        Dim v As New CustomValidator
    '        v.ErrorMessage = "Please select Type of Evidence for the file you are uploading"
    '        v.IsValid = False
    '        Me.Page.Validators.Add(v)
    '        Return
    '    End If
    '    Dim rowAttachment = WorkingData.EnrolmentRequestAttachments.NewRow
    '    _lastAttachmentID -= 1
    '    With rowAttachment

    '        Dim ValidatorAppend As String = .TypeOfEvidence
    '        .AttachmentID = _lastAttachmentID
    '        .TypeOfEvidence = ddlTypeOfEvidence.SelectedValue
    '        ' .Notes = txtNotes.Text.Trim
    '        .Attachment = fuAttachment.FileBytes
    '        .FileName = fuAttachment.FileName
    '        .Size = fuAttachment.FileBytes.Length
    '        hiddenvalidator.Value = (hiddenvalidator.Value + ValidatorAppend)
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
    '    ''Redirecting to self instead of just resetting controls to avoid issue of attachment being added on browser refresh.

    '    Response.Redirect(GetResourceValue("checkout_attachments_HE_aspx"))
    'End Sub

    '''' <summary>
    '''' Binding Attachment table to repeater to display already uploaded attachments to user.
    '''' </summary>
    'Private Sub loadAttachments()
    '    rptAttachments.DataSource = WorkingData.EnrolmentRequestAttachments
    '    rptAttachments.DataBind()
    '    If (WorkingData.EnrolmentRequestAttachments.Rows.Count = 0) Then
    '        trNoItems.Visible = True
    '    Else
    '        trNoItems.Visible = False
    '    End If
    'End Sub

    ''Bring in the Fees
    Protected Sub PopulateOfferingFeeTable()
        'Load all offerings in the shopping basket
        Dim stb As New Text.StringBuilder
        For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
            If stb.Length > 0 Then stb.Append(",")
            stb.Append(item.OfferingID)
            '  feeamount.InnerText = "Please note the fee for this course is " + item.Cost.ToString()
        Next

        'Dim item2 As New ShoppingCartItem()
        'With WorkingData.ShoppingCart
        '    If Not .Items.Contains(item2) Then
        '        If item2.Cost > 0 Then
        '            feeamount.InnerText = "Please note the fee for this course is " + item2.Cost.ToString()
        '        End If
        '    End If
        'End With

        If stb.Length > 0 Then
            'Load offerings
            Dim tblOffering As New OfferingDataTable
            Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblOffering)
            vOffering.Columns.AddPKColumns()
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn, tblOffering.SIDColumn, tblOffering.WebSiteAvailabilityIDColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

            tblOffering.TableAdapter.Load(tblOffering, vOffering)



            Me.GridView2.DataSource = tblOffering
            Me.GridView2.DataBind()
            Me.GridView2.Visible = True
        End If
    End Sub

End Class
