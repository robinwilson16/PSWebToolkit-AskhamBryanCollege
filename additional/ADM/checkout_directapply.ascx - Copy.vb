Option Explicit Off
Option Strict Off
Imports System.IO
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class checkout_directapply
    Inherits webenrolmentcontrolvalidate

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







        Session("RequestMode") = RequestMode.ApplicationRequest


        If Not IsPostBack Then

            PutAllOfferingsInBasket()
            PopulateOfferingFeeTable()




        Else




            Page.MaintainScrollPositionOnPostBack = True
            Dim pcode As String = Replace(postcode.Value, " ", "")
            If Len(pcode) > 0 Then



                Try
                    WorkingData.ApplicationRequestRow.PostcodeOut = pcode.Substring(0, pcode.Length - 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.ApplicationRequestRow.PostcodeOut = ""
                End Try

                Try
                    WorkingData.ApplicationRequestRow.PostcodeIn = Right(pcode, 3)
                Catch ex As ArgumentOutOfRangeException
                    WorkingData.ApplicationRequestRow.PostcodeIn = ""
                End Try
                postcode.Value = WorkingData.ApplicationRequestRow.PostcodeOut & WorkingData.ApplicationRequestRow.PostcodeIn
            End If


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


                    item.Cost = 0


                    item.Description = .GetRowDescription



                    item.ItemType = "Application"

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



                    item.ItemType = "Application"

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



                    item.ItemType = "Application"

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



                    item.ItemType = "Application"

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



                    item.ItemType = "Application"

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



                    item.ItemType = "Application"

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

        ' Residency dropdown reordering
        Dim ctlNationality As DropDownList = TryCast(fldNationalityID.InternalFieldControl, DropDownList)
        '  Dim ctlResidence As DropDownList = TryCast(StudentEnrolmentField9.InternalFieldControl, DropDownList)
        Dim ctlEthnicity As DropDownList = TryCast(StudentEnrolmentField12.InternalFieldControl, DropDownList)
        ' Dim ctlLanguage As DropDownList = TryCast(fldLanguage.InternalFieldControl, DropDownList)


        Dim itemGB = ctlNationality.Items.FindByValue("GB") ' United Kingdom
        ' Dim itemXF = ctlResidence.Items.FindByValue("XF") ' UK
        Dim ItemEng = ctlEthnicity.Items.FindByValue("31")
        ' Dim itemLang = ctlLanguage.Items.FindByValue("1")

        ctlEthnicity.Items.Remove(ItemEng)
        ctlEthnicity.Items.Insert(1, ItemEng)

        ' ctlResidence.Items.Remove(itemXF)
        ' ctlResidence.Items.Insert(1, itemXF)


        ctlNationality.Items.Remove(itemGB)
        ctlNationality.Items.Insert(1, itemGB)

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
            Dim tblOffering As New OfferingDataTable
            Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblOffering)
            vOffering.Columns.AddPKColumns()
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn, tblOffering.SIDColumn, tblOffering.WebSiteAvailabilityIDColumn)
            vOffering.Columns.EnsureColumnIsSelected(False, False, tblOffering.KISCourseCodeColumn)

            vOffering.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, stb.ToString, FilterOperator.OperatorInList)

            tblOffering.TableAdapter.Load(tblOffering, vOffering)





            Me.GridView1.DataSource = tblOffering
            Me.GridView1.DataBind()
            Me.GridView1.Visible = True


        End If
    End Sub

    ''Databind the Grid
    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound



        If e.Row.RowType = DataControlRowType.DataRow Then


            Dim OfferingID As Integer = CInt(DataBinder.Eval(e.Row.DataItem, "OfferingID"))

        End If
    End Sub

    Public Overrides Sub ValidateControl()


        If intCurrentQuals = 0 AndAlso tblQuals.Visible = True Then

            Dim v As New CustomValidator
            v.IsValid = False
            v.ErrorMessage = "Please add your qualifications"
            Me.Page.Validators.Add(v)
            tblQuals.Attributes.Add("border:", "1 px solid red;")

        End If



        'If Not chkConfirm.Checked Then

        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Please confirm the declaration"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)

        'End If



        If Len(txtAddress1.Value) = 0 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must enter the 1st line of the address"
            v.IsValid = False
            Me.Page.Validators.Add(v)
            txtAddress1.Style.Add("border", "1px solid red")
        End If

        If Len(txtAddress2.Value) = 0 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must enter the 2nd line of the address"
            v.IsValid = False
            Me.Page.Validators.Add(v)
            txtAddress2.Style.Add("border", "1px solid red")
        End If

        If Len(postcode.Value) = 0 Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must enter the postcode"
            v.IsValid = False
            Me.Page.Validators.Add(v)
            postcode.Style.Add("border", "1px solid red")
        End If

        If AdditionalSupport.SelectedValue = "" Then


            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Did you receive additional support at school"
            Me.Page.Validators.Add(a)
            AdditionalSupport.Style.Add("border", "1px solid red")



        End If



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


        If IsPostBack Then
            Page.MaintainScrollPositionOnPostBack = True
            Dim c As Control = GetPostBackControl(Me.Page)
            If c.GetType Is GetType(Button) Then
                Dim btn = DirectCast(c, Button)
                If btn.Text = "Add row" Then
                    intCurrentQuals += 1
                ElseIf btn.ID = "btnNoPriorQualifications" Then
                    intCurrentQuals = 0
                    WorkingData.EnrolmentRequestQualsOnEntry.Clear()
                    slidingdiv.Visible = Not slidingdiv.Visible
                    If slidingdiv.Visible Then
                        btn.Text = "No prior qualifications"
                        btn.ToolTip = "Click to remove all the items listed below (And hide the list)"
                    Else
                        btn.Text = "Add prior qualifications"
                        btn.ToolTip = "Click to show a list below that you can add Qualifications to"
                    End If
                End If
            End If
        End If




        For i = 0 To intCurrentQuals
            Dim row As New TableRow
            Dim cell1, cell2, cell3, cell5, cell6, cell7 As New TableCell
            Dim ctl1, ctl2, ctl3, ctl5, ctl6, ctl7 As New StudentQualsOnEntryField
            cell1.Visible = False

            ctl1.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.QualID
            ctl1.StudentQualsOnEntryRowNumber = i

            ctl1.LabelWidth = 67
            ctl1.IsHidden = True

            'show/hide mobile
            cell1.Controls.Add(ctl1)

            ctl2.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Subject
            ctl2.StudentQualsOnEntryRowNumber = i
            ctl2.IsRequired = True
            ctl2.LabelWidth = 72
            ctl2.CustomCaption = "Subject"
            cell2.Controls.Add(ctl2)

            ctl3.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Grade
            ctl3.StudentQualsOnEntryRowNumber = i
            ctl3.IsRequired = True
            ctl3.LabelWidth = 62
            ctl3.CustomCaption = "Grade"
            'ctl3.ExcludedIDValues = "1,2,3,4,5,6,7,8,9,0" 'This would exclude certain grades from the drop down list
            cell3.Controls.Add(ctl3)

            'ctl4.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.PredictedGrade
            'ctl4.StudentQualsOnEntryRowNumber = i
            'ctl4.LabelWidth = 90
            'cell4.Controls.Add(ctl4)

            ctl5.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.DateAwarded
            ctl5.StudentQualsOnEntryRowNumber = i
            ctl5.LabelWidth = 90
            ctl5.IsRequired = True
            ctl5.CustomFieldType = CCCFieldType.Date
            ctl5.CustomCaption = "Date"
            cell5.Controls.Add(ctl5)

            ctl6.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Level

            ctl6.StudentQualsOnEntryRowNumber = i
            ctl6.LabelWidth = 62
            ctl6.IsRequired = True
            ctl6.CustomCaption = "Level"

            cell6.Controls.Add(ctl6)

            ctl7.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.PredictedGrade
            ctl7.StudentQualsOnEntryRowNumber = i
            ctl7.IsRequired = True
            ctl7.CustomCaption = "Predicted Grade"
            ctl7.LabelWidth = 140

            cell7.Controls.Add(ctl7)

            row.Cells.AddRange({cell1, cell2, cell3, cell5, cell6, cell7})
            tblQuals.Rows.Add(row)
            'tblQuals.Rows.Add(row)

        Next

        If IsPostBack Then
            Dim c As Control = GetPostBackControl(Me.Page)
            If c.GetType Is GetType(Button) Then
                Dim btn = DirectCast(c, Button)
                If btn.Text = "Add Row" Then
                    intCurrentReferences += 1
                ElseIf btn.ID = "btnNoReferences" Then
                    intCurrentReferences = 0
                    WorkingData.EnrolmentRequestHE.Clear()
                    slidingdiv.Visible = Not slidingdiv.Visible
                    If slidingdiv.Visible Then
                        btn.Text = "No References"
                        btn.ToolTip = "Click to remove all the items listed below (And hide the list)"
                    Else
                        btn.Text = "Add References"
                        btn.ToolTip = "Click to show a list below that you can add References to"
                    End If
                End If
            End If
        End If

        If refs.Visible Then

            For i = 0 To intCurrentReferences
                Dim row1, row2 As New HtmlTableRow
                Dim cell1, cell2, cell3, cell4, cell5, cell6 As New HtmlTableCell
                Dim ctl1, ctl2, ctl3, ctl4, ctl5, ctl6 As New StudentReferenceField

                ctl1.StudentReferenceFieldType = StudentReferenceFieldType.RefereeSurname
                ctl1.StudentReferenceRowNumber = i

                cell1.Controls.Add(ctl1)

                ctl2.StudentReferenceFieldType = StudentReferenceFieldType.RefereeForename
                ctl2.StudentReferenceRowNumber = i

                cell2.Controls.Add(ctl2)

                ctl3.StudentReferenceFieldType = StudentReferenceFieldType.RefereeTel
                ctl3.StudentReferenceRowNumber = i
                ctl3.CustomCaption = "Tel"
                cell3.Controls.Add(ctl3)

                ctl4.StudentReferenceFieldType = StudentReferenceFieldType.RefereeEmail
                ctl4.StudentReferenceRowNumber = i
                ctl4.CustomCaption = "Email"

                cell4.Controls.Add(ctl4)

                ctl5.StudentReferenceFieldType = StudentReferenceFieldType.RefereeRelationshipToStudent
                ctl5.StudentReferenceRowNumber = i
                ctl5.CustomCaption = "Relationship to you"
                cell5.Controls.Add(ctl5)

                ctl6.StudentReferenceFieldType = StudentReferenceFieldType.RefereeJobTitle
                ctl6.StudentReferenceRowNumber = i
                ctl6.CustomCaption = "Referee Job Title"
                cell6.Controls.Add(ctl6)

                row1.Cells.Add(cell1)
                row1.Cells.Add(cell2)
                row1.Cells.Add(cell3)
                row2.Cells.Add(cell4)
                row2.Cells.Add(cell5)
                row2.Cells.Add(cell6)

                If i Mod 2 = 0 Then
                    row1.Attributes.Add("style", "background-color:#f9f9f9")
                    row2.Attributes.Add("style", "background-color:#f9f9f9")
                End If

                tblReferences.Rows.Add(row1)
                tblReferences.Rows.Add(row2)
            Next
        End If
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



        WorkingData.ApplicationRequestRow.Address1 = txtAddress1.Value
        WorkingData.ApplicationRequestRow.Address2 = txtAddress2.Value
        WorkingData.ApplicationRequestRow.Address3 = txtAddress3.Value
        WorkingData.ApplicationRequestRow.Address4 = txtAddress4.Value

        Dim pcode As String = Replace(postcode.Value, " ", "")
        If Len(pcode) > 0 Then

            'avoid dodgy postcodes breaking system
            Try
                WorkingData.EnrolmentRequest(0).PostcodeOut = pcode.Substring(0, pcode.Length - 3)
            Catch ex As ArgumentOutOfRangeException
                WorkingData.EnrolmentRequest(0).PostcodeOut = ""
            End Try

            Try
                WorkingData.EnrolmentRequest(0).PostcodeIn = Right(pcode, 3)
            Catch ex As ArgumentOutOfRangeException
                WorkingData.EnrolmentRequest(0).PostcodeIn = ""
            End Try


        End If



        WorkingData.ApplicationRequestRow.EuroResidentID = CType(RadioButtonListEU.SelectedValue, Boolean?)
        WorkingData.ApplicationRequestRow.CriminalConvictionID = CType(RadioButtonList1.SelectedValue, Integer?)






        WorkingData.ApplicationRequestRow.StudentDeclaration = "Accepted Terms & Conditions as stated on: " & CStr(System.DateTime.Now)


        If Len(Contact1Postcode.Value) > 0 Then
            WorkingData.ApplicationRequestRow.Contact1PostCodeOut = Contact1Postcode.Value.Substring(0, Contact1Postcode.Value.Length - 3).Trim
            WorkingData.ApplicationRequestRow.Contact1PostCodeIn = Right(Contact1Postcode.Value, 3).Trim
        End If

        'If Len(contact2postcode.Value) > 0 Then
        '    WorkingData.ApplicationRequestRow.Contact2PostCodeOut = contact2postcode.Value.Substring(0, contact2postcode.Value.Length - 3).Trim
        '    WorkingData.ApplicationRequestRow.Contact2PostCodeIn = Right(contact2postcode.Value, 3).Trim
        'End If

        If LivesWithContact1.SelectedValue = "1" Then
            WorkingData.ApplicationRequestRow.Contact1Address1 = txtAddress1.Value
            WorkingData.ApplicationRequestRow.Contact1Address2 = txtAddress2.Value
            WorkingData.ApplicationRequestRow.Contact1Address3 = txtAddress3.Value
            WorkingData.ApplicationRequestRow.Contact1Address4 = txtAddress4.Value

            WorkingData.ApplicationRequestRow.Contact1PostCodeOut = postcode.Value.Substring(0, postcode.Value.Length - 3).Trim
            WorkingData.ApplicationRequestRow.Contact1PostCodeIn = Right(postcode.Value, 3).Trim

        End If


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


End Class
