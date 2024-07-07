Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon

Partial Class checkout_feeremission_new
    Inherits CheckoutBaseControl

    Private Property _lastAttachmentID() As Integer
        Get
            Return CInt(HttpContext.Current.Session("LastAttachmentID"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("LastAttachmentID") = value
        End Set
    End Property

    Public ReadOnly Property OfferingID() As Integer
        Get
            If Me.DesignMode OrElse CCCBlankLibrary.IsBlank(Me.Page.Request("OfferingID")) Then
                Return -1
            Else
                Return CInt(Me.Page.Request("OfferingID"))
            End If
        End Get
    End Property
    Protected Overrides Sub OnLoad(e As EventArgs)
        MyBase.OnLoad(e)

        ''Dont need to clear class attributes for standalone page

        ''Clear class attributes first
        'Me.divmain.Attributes("class") = "panel panel-danger"

        ''Breadcrumbs
        'If WorkingData.ShoppingCart.ContainsItemsOfType("Application") AndAlso WorkingData.ShoppingCart.ContainsItemsOfType("Enrolment") Then
        '    breadcrumbenrols.Visible = True
        '    Me.divmain.Attributes("class") = "panel panel-danger"
        'ElseIf WorkingData.ShoppingCart.ContainsItemsOfType("Application") Then
        '    breadcrumbenrols.Visible = False
        '    Me.divmain.Attributes("class") = "panel panel-success"
        'ElseIf WorkingData.ShoppingCart.ContainsItemsOfType("Enrolment") Then
        '    breadcrumbenrols.Visible = True
        '    Me.divmain.Attributes("class") = "panel panel-danger"
        'ElseIf WorkingData.ShoppingCart.ContainsItemsOfType("Enquiry") Then
        '    breadcrumbenrols.Visible = False
        '    Me.divmain.Attributes("class") = "panel panel-warning"
        'Else
        '    breadcrumbenrols.Visible = False
        '    Me.divmain.Attributes("class") = "panel panel-danger"
        'End If

        Dim intOfferingID As Integer = Me.OfferingID
        If intOfferingID <> -1 Then

            Dim tblOffering As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.CourseInformationIDColumn, tblOffering.TotalFeeAmountColumn)
            v.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, intOfferingID)
            tblOffering.TableAdapter.Load(tblOffering, v)

            If tblOffering.Count > 0 AndAlso tblOffering(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering(0)
                    ' Default to the Standard fee - This is used when showing Total cost of basket on checkout page.
                    ' Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))
                    If .TotalFeeAmount.HasValue Then
                        item.Cost = .TotalFeeAmount.Value.ToString()
                    End If
                    item.Description = .GetRowDescription
                    item.ItemType = "Enrolment"
                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault
                    ' Set Session flag to indicate if Funding Model is Adult Skills (35) if not already set
                    'If CType(Session("FundingModel35"), Boolean) = False Then
                    '    Session("FundingModel35") = (.Funding2ID = "35")
                    'End If
                End With
                With WorkingData.ShoppingCart
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With
            End If
        End If

        If Not IsPostBack Then
            ' Insert the table of offerings
            PopulateOfferingFeeTable()
            loadAttachments()
        End If
    End Sub

    Protected Sub PopulateOfferingFeeTable()
        'Load all offerings in the shopping basket
        Dim stb As New Text.StringBuilder
        For Each item As ShoppingCartItem In WorkingData.ShoppingCart.Items
            If stb.Length > 0 Then stb.Append(",")
            stb.Append(item.OfferingID)
        Next
        If stb.Length > 0 Then
            'Load offerings
            Dim tblOffering As New OfferingDataTable
            Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblOffering)
            vOffering.Columns.AddPKColumns()
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

            tblOffering.TableAdapter.Load(tblOffering, vOffering)

            Me.GridView1.DataSource = tblOffering
            Me.GridView1.DataBind()
            Me.GridView1.Visible = True
        End If
    End Sub
    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            ' Obtain the individual fee types
            'Dim lblStandardFee As Label = CType(e.Row.FindControl("lblStandardFee"), Label)
            'Dim lblConcessionFee As Label = CType(e.Row.FindControl("lblConcessionFee"), Label)
            'Dim lblBenefitsFee As Label = CType(e.Row.FindControl("lblBenefitsFee"), Label)

            Dim OfferingID As Integer = DataBinder.Eval(e.Row.DataItem, "OfferingID")
            '  Dim CourseOfferingFees As New CourseOfferingFees(OfferingID)

            'Dim StandardFee As Decimal = CourseOfferingFees.GetFee("Standard")
            'Dim ConcessionFee As Decimal = CourseOfferingFees.GetFee("Concessionary")
            'Dim BenefitsFee As Decimal = CourseOfferingFees.GetFee("Benefits")

            'lblStandardFee.Text = Format(StandardFee, "c")
            'lblConcessionFee.Text = Format(ConcessionFee, "c")
            'lblBenefitsFee.Text = Format(BenefitsFee, "c")
        End If
    End Sub

    'Protected Overrides Sub CreateChildControls()
    '    MyBase.CreateChildControls()
    '    ''No Postback controls because we arent using add or remove buttons
    '    'If IsPostBack Then
    '    '    Dim c As Control = GetPostBackControl(Me.Page)
    '    '    If c.GetType Is GetType(Button) Then
    '    '        Dim btn = DirectCast(c, Button)
    '    '        If btn.Text = "Add Row" Then
    '    '            intCurrentEmploymentRecords += 1
    '    '        ElseIf btn.ID = "btnNoPreviousEmployment" Then
    '    '            intCurrentEmploymentRecords = 0
    '    '            WorkingData.EnrolmentRequestEmploymentHistory.Clear()
    '    '            slidingdiv.Visible = Not slidingdiv.Visible
    '    '            If slidingdiv.Visible Then
    '    '                btn.Text = "No previous employment"
    '    '                btn.ToolTip = "Click to remove all the items listed below (And hide the list)"
    '    '            Else
    '    '                btn.Text = "Add previous employment"
    '    '                btn.ToolTip = "Click to show a list below that you can add previous employment records to"
    '    '            End If
    '    '        End If
    '    '    End If
    '    'End If


    '    'Section A - Employed EmploymentTable
    '    If slidingdiv.Visible Then

    '        For i = 0 To intCurrentEmploymentRecords
    '            Dim row1 As New TableRow
    '            Dim cell8, cell9, cell11 As New TableCell
    '            Dim ctl8, ctl9, ctl11 As New StudentEmploymentHistoryField


    '            ctl8.StudentEmploymentHistoryFieldType = StudentEmploymentHistoryFieldType.EmploymentIntensityID
    '            ctl8.StudentEmploymentHistoryRowNumber = i
    '            ctl8.CustomCaption = "Emp Intensity"
    '            cell8.Controls.Add(ctl8)



    '            ctl9.StudentEmploymentHistoryFieldType = StudentEmploymentHistoryFieldType.LengthOfEmploymentID
    '            ctl9.StudentEmploymentHistoryRowNumber = i
    '            ctl9.CustomCaption = "Length of Employment"
    '            cell9.Controls.Add(ctl9)

    '            ctl11.StudentEmploymentHistoryFieldType = StudentEmploymentHistoryFieldType.DateFrom
    '            ctl11.StudentEmploymentHistoryRowNumber = i
    '            ctl11.CustomCaption = "Date From"
    '            cell11.Controls.Add(ctl11)

    '            row1.Cells.Add(cell8)
    '            row1.Cells.Add(cell9)
    '            row1.Cells.Add(cell11)

    '            If i Mod 2 = 0 Then
    '                row1.Attributes.Add("style", "background-color:#f9f9f9")

    '            End If

    '            tblEmployment.Rows.Add(row1)


    '        Next
    '    End If
    '    'Section B - Unemployed EmploymentTable
    '    If slidingDiv2.Visible Then

    '        For i = 0 To intCurrentEmploymentRecords
    '            Dim row2 As New TableRow
    '            Dim cell5, cell7, cell10 As New TableCell
    '            Dim ctl5, ctl7, ctl10 As New StudentEmploymentHistoryField


    '            ctl5.StudentEmploymentHistoryFieldType = StudentEmploymentHistoryFieldType.ReasonForUnemploymentID
    '            ctl5.StudentEmploymentHistoryRowNumber = i
    '            ctl5.CustomCaption = "Unemployment Reason"
    '            cell5.Controls.Add(ctl5)

    '            ctl10.StudentEmploymentHistoryFieldType = StudentEmploymentHistoryFieldType.LengthOfUnemploymentID
    '            ctl10.StudentEmploymentHistoryRowNumber = i
    '            ctl10.CustomCaption = "Unemployment Length"
    '            cell10.Controls.Add(ctl10)


    '            row2.Cells.Add(cell7)
    '            row2.Cells.Add(cell5)
    '            row2.Cells.Add(cell10)

    '            If i Mod 2 = 0 Then

    '                row2.Attributes.Add("style", "background-color:#f9f9f9")
    '            End If

    '            Table1.Rows.Add(row2)


    '        Next
    '    End If

    '    'Standalone EmploymentStatus Column
    '    If statuscolumn.Visible Then

    '        For i = 0 To intCurrentEmploymentRecords
    '            Dim row3 As New TableRow
    '            Dim cell6 As New TableCell
    '            Dim ctl6 As New StudentEmploymentHistoryField

    '            ctl6.StudentEmploymentHistoryFieldType = StudentEmploymentHistoryFieldType.EmploymentStatusID
    '            ctl6.StudentEmploymentHistoryRowNumber = i
    '            ctl6.CustomCaption = "Employment Status"
    '            ctl6.IsRequired = True
    '            ctl6.ExcludedIDValues = "98"
    '            ctl6.CustomFieldType = "Datetime"

    '            cell6.Controls.Add(ctl6)
    '            row3.Cells.Add(cell6)

    '            If i Mod 2 = 0 Then
    '                row3.Attributes.Add("style", "background-color:#f9f9f9; Width:300px; text-align:left;")

    '            End If

    '            Table2.Rows.Add(row3)

    '        Next

    '    End If
    '    'standalone Benefits Status column
    '    If Div1.Visible Then

    '        For i = 0 To intCurrentEmploymentRecords
    '            Dim row4 As New TableRow
    '            Dim cell7 As New TableCell
    '            Dim ctl7 As New StudentEmploymentHistoryField

    '            ctl7.StudentEmploymentHistoryFieldType = StudentEmploymentHistoryFieldType.BenefitStatusIndicatorID
    '            ctl7.StudentEmploymentHistoryRowNumber = i
    '            ctl7.CustomCaption = "Benefits Status"
    '            cell7.Controls.Add(ctl7)

    '            row4.Cells.Add(cell7)

    '            If i Mod 2 = 0 Then
    '                row4.Attributes.Add("style", "background-color:#f9f9f9; Width:300px; text-align:left;")

    '            End If

    '            Table3.Rows.Add(row4)

    '        Next

    '    End If





    'End Sub

    Public Property intCurrentEmploymentRecords() As Integer
        Get
            Return CInt(HttpContext.Current.Session("intEmploymentRows"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("intEmploymentRows") = value
        End Set
    End Property

    Public Overrides Sub ValidateControl()

        If trNoItems.Visible AndAlso Not (Field_BenefitStatusIndicatorID.Value = "") Then

            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "If you are on benefits, you must upload evidence"
            Me.Page.Validators.Add(a)
            'ValidationSummary1.CssClass = "error"

        End If
        ''Employed check for EII and LOE and SelfEmp
        If Field_EmploymentStatusID.Value = "10" AndAlso rdoSelfEmp.SelectedValue = "" Then

            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "If you are Employed, are you self employed?"
            Me.Page.Validators.Add(a)
            '  ValidationSummary1.CssClass = "error"

        End If
        If Field_EmploymentStatusID.Value = "10" AndAlso (Field_EmploymentIntensityID.Value = "") Then

            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "If you are Employed, please say how many hours you work for per week, and how long"
            Me.Page.Validators.Add(a)
            '  ValidationSummary1.CssClass = "error"

        End If
        If Field_EmploymentStatusID.Value = "10" AndAlso (StudentEmploymentHistoryField1.Value = "") Then

            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "If you are Employed, please say how long youve been employed for, and how many hours"
            Me.Page.Validators.Add(a)
            '  ValidationSummary1.CssClass = "error"

        End If
        ''Unemployed check for length of unemp
        If (Field_EmploymentStatusID.Value = "11" Or Field_EmploymentStatusID.Value = "12") AndAlso Field_LengthOfUnemploymentID.Value = "" Then

            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "If you are unemployed, please say for how long you have been"
            Me.Page.Validators.Add(a)
            '  ValidationSummary1.CssClass = "error"
        End If


        'If trNoItems.Visible = True Then

        '    Dim a As New CustomValidator
        '    a.IsValid = False
        '    a.ErrorMessage = "You must upload evidence of your P60/Payslip or proof of benefits"
        '    Me.Page.Validators.Add(a)

        'End If

        'If RdoSalary.SelectedValue = "1" AndAlso trNoItems.Visible = True Then

        '    Dim b As New CustomValidator
        '    b.IsValid = False
        '    b.ErrorMessage = "If you have ticked that you are above the income threshold, you must provide a P60/Payslip"
        '    Me.Page.Validators.Add(b)

        'End If


    End Sub

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

    Public Function GetRandom(ByVal Min As Integer, ByVal Max As Integer) As Integer
        'function to append random int to Caption Evidence for IX constraint error
        Static Generator As System.Random = New System.Random()
        Return Generator.Next(Min, Max)
    End Function


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
            .TypeOfEvidence = (ddlTypeOfEvidence.SelectedValue & randoms(1000).ToString)
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

            If Len(DoB.Text) > 0 Then
                WorkingData.EnrolmentRequestRow.DateOfBirth = CDate(DoB.Text)
            End If

            If rdoSelfEmp.SelectedValue.ToString.Length > 0 Then

                WorkingData.EnrolmentRequestEmploymentHistoryRow.IsSelfEmployed = rdoSelfEmp.SelectedValue
            End If
            'If rdoGainEmp.SelectedValue.ToString.Length > 0 Then

            '    WorkingData.EnrolmentRequestRow.StudentDetailUserDefined4 = rdoSelfEmp.SelectedValue
            'End If
            'If RdoSalary.SelectedValue.ToString.Length > 0 Then

            '    WorkingData.EnrolmentRequestRow.StudentDetailUserDefined27 = RdoSalary.SelectedValue
            'End If

            HiddenFieldForEmploymentvalue.Value = Field_EmploymentStatusID.Value


            If Field_EmploymentStatusID.Value = "10" Then



                WorkingData.EnrolmentRequestEmploymentHistoryRow.DateFrom = Today

            End If

            Server.Transfer(GetResourceValue("checkout_makepayment_aspx"))
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
