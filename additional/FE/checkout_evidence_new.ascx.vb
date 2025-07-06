Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon

Partial Class checkout_evidence_new
    Inherits CheckoutBaseControl

    Public OfferingID As Integer
    Public Course As Course

    Public ReadOnly Property refno() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("r")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("r"))
            End If
        End Get
    End Property


    Public ReadOnly Property appID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("a")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("a"))
            End If
        End Get
    End Property
    Private Property _lastAttachmentID() As Integer
        Get
            Return CInt(HttpContext.Current.Session("LastAttachmentID"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("LastAttachmentID") = value
        End Set
    End Property

    Public Function GetRandom(ByVal Min As Integer, ByVal Max As Integer) As Integer
        'function to append random int to Caption Evidence for IX constraint error
        Static Generator As System.Random = New System.Random()
        Return Generator.Next(Min, Max)
    End Function
    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        OfferingID = GetProSolutionData.GetOfferingID()
        Course = GetProSolutionData.GetCourseByID(OfferingID)

        'Clear class attributes first
        'Me.divmain.Attributes("class") = "panel panel-danger"

        ''Breadcrumbs
        'If WorkingData.ShoppingCart.ContainsItemsOfType("Application") AndAlso WorkingData.ShoppingCart.ContainsItemsOfType("Enrolment") Then
        '    breadcrumbenrols.Visible = True
        '    Me.divMain.Attributes("class") = "panel panel-danger"
        'ElseIf WorkingData.ShoppingCart.ContainsItemsOfType("Application") Then
        '    breadcrumbenrols.Visible = False
        '    Me.divMain.Attributes("class") = "panel panel-success"
        'ElseIf WorkingData.ShoppingCart.ContainsItemsOfType("Enrolment") Then
        '    breadcrumbenrols.Visible = True
        '    Me.divMain.Attributes("class") = "panel panel-danger"
        'ElseIf WorkingData.ShoppingCart.ContainsItemsOfType("Enquiry") Then
        '    breadcrumbenrols.Visible = False
        '    Me.divMain.Attributes("class") = "panel panel-warning"
        'Else
        '    breadcrumbenrols.Visible = False
        '    Me.divMain.Attributes("class") = "panel panel-danger"
        'End If

        '  If refno() > 0 Then
        ' WorkingData.ApplicationRequestRow.RefNo = refno()
        WorkingData.EnrolmentRequestRow.WebApplicationID = appID()
        WorkingData.EnrolmentRequestRow.Surname = "webapplication"
        WorkingData.EnrolmentRequestRow.FirstForename = "webapplication"
        WorkingData.EnrolmentRequestRow.DateOfBirth = "01/06/2021"
        WorkingData.EnrolmentRequestRow.Address1 = "Address1"
        WorkingData.EnrolmentRequestRow.Email = "web@web.com"
        WorkingData.EnrolmentRequestRow.Sex = "F"
        WorkingData.EnrolmentRequestRow.EthnicGroupID = "34"
        WorkingData.EnrolmentRequestRow.PostcodeOut = "6BZ"
        WorkingData.EnrolmentRequestRow.PostcodeIn = "B66"
        WorkingData.EnrolmentRequestRow.MobileTel = "0766666893"
        WorkingData.EnrolmentRequestRow.RequestStatus = "results"
        '   StudentEnrolmentFieldRefNo.IsReadOnly = True
        'End If

        If Not IsPostBack Then
            loadAttachments()
            PopulateOfferingFeeTable()
            courseLabel.Text = CourseLabelParam()
        End If
    End Sub

    Public ReadOnly Property CourseLabelParam() As String
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("c")) Then
                Return ""
            Else
                Return CStr(Me.Page.Request("c"))
            End If
        End Get
    End Property

    Protected Sub PopulateOfferingFeeTable()

        Dim IntOffering1ID As Integer = 226150
        If IntOffering1ID <> -1 Then
            Dim tblOffering1 As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering1)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering1.WebSiteAvailabilityIDColumn, tblOffering1.CourseInformationIDColumn, tblOffering1.TotalFeeAmountColumn, tblOffering1.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering1.OfferingIDColumn, IntOffering1ID)
            tblOffering1.TableAdapter.Load(tblOffering1, v)
            If tblOffering1.Count > 0 Then
                Dim item As New ShoppingCartItem()
                With tblOffering1(0)
                    'Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))
                    If .TotalFeeAmount.HasValue Then
                        item.Cost = 0
                    End If
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
    'Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
    '    If e.Row.RowType = DataControlRowType.DataRow Then
    '        '' Obtain the individual fee types
    '        'Dim lblStandardFee As Label = CType(e.Row.FindControl("lblStandardFee"), Label)
    '        'Dim lblConcessionFee As Label = CType(e.Row.FindControl("lblConcessionFee"), Label)
    '        'Dim lblBenefitsFee As Label = CType(e.Row.FindControl("lblBenefitsFee"), Label)

    '        'Dim OfferingID As Integer = DataBinder.Eval(e.Row.DataItem, "OfferingID")
    '        'Dim CourseOfferingFees As New CourseOfferingFees(OfferingID)

    '        'Dim StandardFee As Decimal = CourseOfferingFees.GetFee("Standard")
    '        'Dim ConcessionFee As Decimal = CourseOfferingFees.GetFee("Concessionary")
    '        'Dim BenefitsFee As Decimal = CourseOfferingFees.GetFee("Benefits")

    '        'lblStandardFee.Text = Format(StandardFee, "c")
    '        'lblConcessionFee.Text = Format(ConcessionFee, "c")
    '        'lblBenefitsFee.Text = Format(BenefitsFee, "c")
    '    End If
    'End Sub

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
    Public Overrides Sub ValidateControl()


        If trNoItems.Visible = True Then

            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "You must upload evidence of your results - Remember to click 'Upload'"
            Me.Page.Validators.Add(a)

        End If


    End Sub
    Protected Overrides Sub CreateChildControls()
        MyBase.CreateChildControls()


    End Sub



    Private Sub btnUpload_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpload.Click
        trNoItems.Visible = False
        Me.Page.Validate()
        ''Following line is important to perform validations on File Upload control based on setup done on control.
        Me.fuAttachment.ValidateFile()

        If Not Me.Page.IsValid Then
            Return
        End If

        Dim randoms(1000) As Integer
        For i As Integer = 0 To randoms.Length - 1
            randoms(i) = GetRandom(1, 100)
        Next

        Dim rowAttachment = WorkingData.EnrolmentRequestAttachments.NewRow
        _lastAttachmentID -= 1
        With rowAttachment
            .AttachmentID = _lastAttachmentID
            '  .TypeOfEvidence = (ddlTypeOfEvidence.SelectedValue & randoms(1000).ToString)
            .TypeOfEvidence = (ddlTypeOfEvidence.SelectedValue & System.DateTime.Now)
            .Notes = txtNotes.Text.Trim
            .Attachment = fuAttachment.FileBytes
            .FileName = fuAttachment.FileName
            .Size = fuAttachment.FileBytes.Length
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
        ''Reload attachments to refresh the grid and clear the controls for user to do fresh entry again.
        loadAttachments()
        txtNotes.Text = Nothing
        ddlTypeOfEvidence.SelectedIndex = 0
    End Sub

    Private Sub btnContinue_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnContinue.Click


        Me.Page.Validate()

        If Me.Page.IsValid Then
            If WorkingData.EnrolmentRequestRow.WebApplicationID > 0 Then
                Response.Redirect(GetResourceValue("checkout_evidence_dataprotection"))
            End If

        End If

    End Sub

    Private Sub loadAttachments()
        rptAttachments.DataSource = WorkingData.EnrolmentRequestAttachments
        rptAttachments.DataBind()
        If (WorkingData.EnrolmentRequestAttachments.Rows.Count = 0) Then
            trNoItems.Visible = True
        Else
            trNoItems.Visible = False
        End If
    End Sub

End Class
