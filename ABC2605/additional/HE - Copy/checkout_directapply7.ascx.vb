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


    End Sub



    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click


        Dim redirectString As String = String.Empty

        Me.Page.Validate()


        If Me.Page.IsValid Then


            CheckData()

            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = ""
            redirectString = GetResourceValue("checkout_makepayment_aspx")
            Response.Redirect(redirectString)

        End If



    End Sub


    Protected Sub btnBack_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnBack.Click


        Dim redirectString As String = String.Empty

        Me.Page.Validate()


        If Me.Page.IsValid Then


            CheckData()


            redirectString = GetResourceValue("checkout_directapply6_aspx")
            Response.Redirect(redirectString)

        End If



    End Sub


End Class
