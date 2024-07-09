Option Explicit Off
Option Strict Off
Imports System.IO
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class checkout_directapply
    Inherits webenrolmentcontrolvalidate

    Public MainOfferingID As Integer
    Public Course As Course

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

        '  Response.Write(WorkingData.EnrolmentRequestRow.StudyElsewhere)



        'If WorkingData.EnrolmentRequestRow. = False Then
        '    rdoStillAt.SelectedValue = 0
        'Else
        '    rdoStillAt.SelectedValue = 1
        'End If




        Session("RequestMode") = RequestMode.ApplicationRequest


        If Not IsPostBack Then

            PutAllOfferingsInBasket()
            PopulateOfferingFeeTable()

            If WorkingData.EnrolmentRequestRow.StudyElsewhere = False Then
                rdoStillAt.SelectedValue = 0
            Else
                rdoStillAt.SelectedValue = 1
            End If



        Else






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


                    ' item.Cost = 0


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

                    item.Cost = 0


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


                    item.Cost = 0


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


                    item.Cost = 0


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

                    item.Cost = 0


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

                    item.Cost = 0


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

        '' Residency dropdown reordering
        'Dim ctlNationality As DropDownList = TryCast(fldNationalityID.InternalFieldControl, DropDownList)
        ''  Dim ctlResidence As DropDownList = TryCast(StudentEnrolmentField9.InternalFieldControl, DropDownList)
        'Dim ctlEthnicity As DropDownList = TryCast(StudentEnrolmentField12.InternalFieldControl, DropDownList)
        '' Dim ctlLanguage As DropDownList = TryCast(fldLanguage.InternalFieldControl, DropDownList)


        'Dim itemGB = ctlNationality.Items.FindByValue("GB") ' United Kingdom
        '' Dim itemXF = ctlResidence.Items.FindByValue("XF") ' UK
        'Dim ItemEng = ctlEthnicity.Items.FindByValue("31")
        '' Dim itemLang = ctlLanguage.Items.FindByValue("1")

        'ctlEthnicity.Items.Remove(ItemEng)
        'ctlEthnicity.Items.Insert(1, ItemEng)

        '' ctlResidence.Items.Remove(itemXF)
        '' ctlResidence.Items.Insert(1, itemXF)


        'ctlNationality.Items.Remove(itemGB)
        'ctlNationality.Items.Insert(1, itemGB)

        'ctlLanguage.Items.Remove(itemLang)
        ' ctlLanguage.Items.Insert(1, itemLang)

        'Employment field reordering

        'Dim ctlLOE As DropDownList = TryCast(StudentEmploymentHistoryField1.InternalFieldControl, DropDownList)
        'Dim ctlEII As DropDownList = TryCast(Field_EmploymentIntensityID.InternalFieldControl, DropDownList)
        'Dim ctlUL As DropDownList = TryCast(Field_LengthOfUnemploymentID.InternalFieldControl, DropDownList)


        'Dim ItemLOE = ctlLOE.Items.FindByValue("1")
        'ctlLOE.Items.Remove(ItemLOE)
        'ctlLOE.Items.Insert(1, ItemLOE)



        'Dim itemUL1 = ctlUL.Items.FindByValue("1")
        'ctlUL.Items.Remove(itemUL1)
        'ctlUL.Items.Insert(1, itemUL1)



        'Dim itemUL2 = ctlUL.Items.FindByValue("2")
        'ctlUL.Items.Remove(itemUL2)
        'ctlUL.Items.Insert(2, itemUL2)

        'Dim ctlGrades As DropDownList = TryCast(EnglishQual.InternalFieldControl, DropDownList)
        ''Dim ctlPredictedGrades As DropDownList = TryCast(StudentQualsOnEntryField19.InternalFieldControl, DropDownList)

        '' Move all GCSE Grades to the top
        'Dim indexGrade = 0
        'For k As Integer = 0 To ctlGrades.Items.Count - 1 Step 1
        '    Dim item = ctlGrades.Items(k)
        '    Dim itemGradeName = item.Text

        '    ' Is this a GCSE Grade A*-G or 1-9?
        '    Select Case itemGradeName
        '        Case "A*", "A", "B", "C", "D", "E", "F", "G", "U",
        '             "1", "2", "3", "4", "5", "6", "7", "8", "9"
        '            ' Remove the item and reinsert at top
        '            ctlGrades.Items.Remove(item)
        '            ctlGrades.Items.Insert(indexGrade, item)
        '            ' Increment index to maintain alpha sort
        '            indexGrade += 1
        '    End Select
        'Next



        'Dim itemGradeBlank = ctlGrades.Items.FindByValue("")
        'ctlGrades.Items.Remove(itemGradeBlank)
        'ctlGrades.Items.Insert(0, itemGradeBlank)


        'Dim ctlgrades1 As DropDownList = TryCast(MathsQual.InternalFieldControl, DropDownList)

        'Dim indexGrade1 = 0
        'For k As Integer = 0 To ctlgrades1.Items.Count - 1 Step 1
        '    Dim item1 = ctlgrades1.Items(k)
        '    Dim itemGradeName1 = item1.Text

        '    ' Is this a GCSE Grade A*-G or 1-9?
        '    Select Case itemGradeName1
        '        Case "A*", "A", "B", "C", "D", "E", "F", "G", "U",
        '             "1", "2", "3", "4", "5", "6", "7", "8", "9"
        '            ' Remove the item and reinsert at top
        '            ctlgrades1.Items.Remove(item1)
        '            ctlgrades1.Items.Insert(indexGrade1, item1)
        '            ' Increment index to maintain alpha sort
        '            indexGrade1 += 1
        '    End Select
        'Next


        'Dim itemGradeBlank1 = ctlgrades1.Items.FindByValue("")
        'ctlgrades1.Items.Remove(itemGradeBlank1)
        'ctlgrades1.Items.Insert(0, itemGradeBlank1)



        MyBase.RenderControl(writer)

    End Sub

    ''Bring in the Fees
    Protected Sub PopulateOfferingFeeTable()
        'Load all offerings in the shopping basket
        Dim stb As New Text.StringBuilder
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

    Public Overrides Sub ValidateControl()

        'Prior Attainment Level
        If Not IsNothing(fldPriorAttainmentLevelID) Then
            If String.IsNullOrEmpty(fldPriorAttainmentLevelID.Value) Then
                fldPriorAttainmentLevelIDValidator.ErrorMessage = "Prior Attainment Level must not be blank"
                fldPriorAttainmentLevelIDValidator.IsValid = False
                fldPriorAttainmentLevelIDValidator.CssClass = "error alert alert-danger"
                fldPriorAttainmentLevelID.CssClass = "ErrorInput"
            End If
        End If

        'Employment Status
        If Not IsNothing(fldEmploymentStatusID) Then
            If String.IsNullOrEmpty(fldEmploymentStatusID.Value) Then
                fldEmploymentStatusIDValidator.ErrorMessage = "Employment Status must not be blank"
                fldEmploymentStatusIDValidator.IsValid = False
                fldEmploymentStatusIDValidator.CssClass = "error alert alert-danger"
                fldEmploymentStatusID.CssClass = "ErrorInput"
            End If
        End If

        If rdoStillAt.SelectedValue = "" Then
            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Were you in full-time education or training prior to enrolment must not be blank"
            Me.Page.Validators.Add(a)
            rdoStillAt.Style.Add("border", "1px solid red")
        End If

        If WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentStatusID = "10" Then
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentIntensityID = "" Then
                Dim a As New CustomValidator
                a.IsValid = False
                a.ErrorMessage = "I work (hours per week) must not be blank"
                Me.Page.Validators.Add(a)
                fldEmploymentIntensityID.Style.Add("border", "1px solid red")
            End If
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfEmploymentID = "" Then
                Dim a As New CustomValidator
                a.IsValid = False
                a.ErrorMessage = "I have worked (number of months) must not be blank"
                Me.Page.Validators.Add(a)
                fldLengthOfEmploymentID.Style.Add("border", "1px solid red")
            End If
        End If

        If WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentStatusID = "11" Then
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfUnemploymentID = "" Then
                Dim a As New CustomValidator
                a.IsValid = False
                a.ErrorMessage = "Unemployed for (number of months) must not be blank"
                Me.Page.Validators.Add(a)
                fldLengthOfUnemploymentID.Style.Add("border", "1px solid red")
            End If
        End If

        If WorkingData.EnrolmentRequestEmploymentHistoryRow.EmploymentStatusID = "12" Then
            If WorkingData.EnrolmentRequestEmploymentHistoryRow.LengthOfUnemploymentID = "" Then
                Dim a As New CustomValidator
                a.IsValid = False
                a.ErrorMessage = "Unemployed for (number of months) must not be blank"
                Me.Page.Validators.Add(a)
                fldLengthOfUnemploymentID.Style.Add("border", "1px solid red")
            End If
        End If

        'If rdoSelfEmp.SelectedValue = "" Then
        '    Dim a As New CustomValidator
        '    a.IsValid = False
        '    a.ErrorMessage = "Are you self employed must not be blank"
        '    Me.Page.Validators.Add(a)
        '    rdoSelfEmp.Style.Add("border", "1px solid red")
        'End If


        'If intCurrentQuals = 0 AndAlso tblQuals.Visible = True Then

        '    Dim v As New CustomValidator
        '    v.IsValid = False
        '    v.ErrorMessage = "Please add your qualifications"
        '    Me.Page.Validators.Add(v)
        '    tblQuals.Attributes.Add("border:", "1 px solid red;")

        'End If



        'If Not chkConfirm.Checked Then

        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Please confirm the declaration"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)

        'End If







        MyBase.ValidateControl()
    End Sub

    'Private Sub btnUpload_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpload.Click
    '    Page.MaintainScrollPositionOnPostBack = True
    '    trNoItems.Visible = False
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
    '        .Notes = txtNotes.Text.Trim
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
    '    txtNotes.Text = Nothing
    '    ddlTypeOfEvidence.SelectedIndex = 0
    'End Sub

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



        'If Not IsPostBack Then
        '    intCurrentQuals = WorkingData.ApplicationRequestQualsOnEntry.Rows.Count

        'End If
        'Dim rowH As New TableRow

        'Dim c1, c2, c3, c5, c6, c7 As New TableHeaderCell
        'c1.Visible = False
        'rowH.Cells.AddRange({c1, c2, c3, c5, c6, c7})

        'tblQuals.Rows.Add(rowH)


        Dim rowH As New TableRow

        Dim c1, c2, c3, c4, c5 As New TableCell
        c1.Text = "Qualification"
        c1.Attributes.Add("class", "text=center")
        c2.Text = "Subject"
        c3.Text = "Actual Grade"
        c4.Text = "Predicted Grade"
        c5.Text = "Date Awarded"
        rowH.Cells.AddRange({c1, c2, c3, c4, c5})

        'tblQuals.Rows.Add(rowH)

        'If IsPostBack Then
        '    Dim c As Control = GetPostBackControl(Me.Page)
        '    If c.GetType Is GetType(Button) Then
        '        Dim btn = DirectCast(c, Button)
        '        If btn.Text = "Add Row" Then
        '            intCurrentQuals += 1
        '        ElseIf btn.ID = "btnNoPriorQualifications" Then
        '            intCurrentQuals = 0
        '            WorkingData.EnrolmentRequestQualsOnEntry.Clear()
        '            slidingdiv.Visible = Not slidingdiv.Visible
        '            If slidingdiv.Visible Then
        '                btn.Text = "No prior qualifications"
        '                btn.ToolTip = "Click to remove all the items listed below (And hide the list)"
        '            Else
        '                btn.Text = "Add prior qualifications"
        '                btn.ToolTip = "Click to show a list below that you can add Qualifications to"
        '            End If
        '        End If
        '    End If
        'End If

        'If slidingdiv.Visible Then

        '    For i = 0 To intCurrentQuals
        '        Dim row As New TableRow
        '        Dim cell1, cell2, cell3, cell4, cell5 As New TableCell
        '        Dim ctl1, ctl2, ctl3, ctl4, ctl5 As New StudentQualsOnEntryField


        '        ctl1.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.QualID
        '        ctl1.StudentQualsOnEntryRowNumber = i
        '        ctl1.LabelWidth = 0
        '        cell1.Controls.Add(ctl1)

        '        ctl2.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Subject
        '        ctl2.StudentQualsOnEntryRowNumber = i
        '        ctl2.LabelWidth = 0
        '        cell2.Controls.Add(ctl2)

        '        ctl3.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Grade
        '        ctl3.StudentQualsOnEntryRowNumber = i
        '        ctl3.LabelWidth = 0
        '        'ctl3.ExcludedIDValues = "1,2,3,4,5,6,7,8,9,0" 'This would exclude certain grades from the drop down list
        '        cell3.Controls.Add(ctl3)

        '        ctl4.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.PredictedGrade
        '        ctl4.StudentQualsOnEntryRowNumber = i
        '        ctl4.LabelWidth = 0
        '        cell4.Controls.Add(ctl4)

        '        ctl5.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.DateAwarded
        '        ctl5.StudentQualsOnEntryRowNumber = i
        '        ctl5.LabelWidth = 0
        '        ctl5.CustomFieldType = CCCFieldType.Date
        '        cell5.Controls.Add(ctl5)

        '        row.Cells.AddRange({cell1, cell2, cell3, cell4, cell5})
        '        tblQuals.Rows.Add(row)

        '    Next
        'End If



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

        Response.Write(rdoStillAt.SelectedValue)

        WorkingData.EnrolmentRequestRow.StudyElsewhere = CType(rdoStillAt.SelectedValue, Integer?)


    End Sub



    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click
        CheckData()

        Dim redirectString As String = String.Empty

        Me.Page.Validate()


        If Me.Page.IsValid Then


            CheckData()


            redirectString = GetResourceValue("checkout_enrolFC6_aspx")
            Response.Redirect(redirectString)

        End If



    End Sub


    Protected Sub btnBack_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnBack.Click


        Dim redirectString As String = String.Empty

        Me.Page.Validate()


        If Me.Page.IsValid Then


            CheckData()


            redirectString = GetResourceValue("checkout_enrolFC4_aspx")
            Response.Redirect(redirectString)

        End If



    End Sub


End Class



