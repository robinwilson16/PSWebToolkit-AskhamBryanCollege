Imports CompassCC.ProSolution.PSWebEnrolmentKit
Imports CompassCC.CCCSystem.CCCCommon
''' <summary>
''' CCCPS-75837: A sample step to depict integration of new Attachemnt option for user to upload data against Enrolment and Application requests.
''' </summary>
Partial Class checkout_evidence_new
    Inherits CheckoutBaseControl
    'Implements IHttpModule
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

        Session("RequestMode") = RequestMode.EnrolmentRequest

        If Not IsPostBack Then

            PutAllOfferingsInBasket()

            PopulateOfferingFeeTable()

        End If
    End Sub
    Protected Sub PutAllOfferingsInBasket()




        ' Dim intOfferingID As Integer = 788710
        Dim intOfferingID As Integer = OfferingID
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

                    'Dim CourseOfferingFees As New CourseOfferingFees(CType(.OfferingID, Integer))
                    If .TotalFeeAmount.HasValue Then
                        item.Cost = CDec(.TotalFeeAmount.Value.ToString())
                    End If
                    item.Description = .GetRowDescription
                    item.ItemType = "Enrolment"
                    item.OfferingID = .OfferingID.Value
                    item.CourseInfoID = .CourseInformationID.GetValueOrDefault

                End With
                With WorkingData.ShoppingCart
                    WorkingData.ClearWorkingData()
                    If Not .Items.Contains(item) Then
                        .Items.Add(item)
                    End If
                End With
            End If
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
            Me.GridView1.Visible = False
        End If
    End Sub
    Protected Sub GridView1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then

            Dim OfferingID As Integer = DataBinder.Eval(e.Row.DataItem, "OfferingID")

        End If
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



    Protected Overrides Sub CreateChildControls()
        MyBase.CreateChildControls()

        If IsPostBack Then
            Page.MaintainScrollPositionOnPostBack = True
        End If


        'If Not FileUpload1.HasFile AndAlso uploadhide.Visible = False AndAlso IsPostBack Then

        '    Dim v As New CustomValidator
        '    v.IsValid = False
        '    v.ErrorMessage = "Please upload a photo before adding grades"
        '    Me.Page.Validators.Add(v)

        'Else

        'Recreate the header row
        Dim rowH As New TableRow

        Dim c1, c2, c3, c4, c5 As New TableHeaderCell
        'c1.Text = "Qualification"
        'c1.Attributes.Add("class", "text=center")
        'c2.Text = "Subject (if not in list)"
        'c3.Text = "Grade"
        'c4.Text = "Predicted Grade"
        'c5.Text = "Date Awarded"
        rowH.Cells.AddRange({c1, c2, c3, c4, c5})

        tblQuals.Rows.Add(rowH)

        If IsPostBack Then
            Page.MaintainScrollPositionOnPostBack = True
            Dim c As Control = GetPostBackControl(Me.Page)
            If c.GetType Is GetType(Button) Then
                Dim btn = DirectCast(c, Button)
                If btn.Text = "Add Row" Then
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

        'If IsPostBack AndAlso FileUpload1.HasFile AndAlso uploadhide.Visible = False Then

        '    Dim fs As System.IO.Stream = FileUpload1.PostedFile.InputStream()
        '    Dim MyData(CInt(fs.Length)) As Byte
        '    fs.Read(MyData, 0, CInt(fs.Length))
        '    fs.Close()

        '    WorkingData.EnrolmentRequestRow.Photo = MyData
        '    uploadhide.Visible = True

        'End If

        If slidingdiv.Visible Then

            For i = 0 To intCurrentQuals
                Dim row As New TableRow
                Dim cell1, cell2, cell3, cell4, cell5 As New TableCell
                Dim ctl1, ctl2, ctl3, ctl4, ctl5 As New StudentQualsOnEntryField


                ctl1.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.QualID
                ctl1.StudentQualsOnEntryRowNumber = i
                ctl1.LabelWidth = 67
                ctl1.CustomCaption = "Qualification"
                ctl1.ExcludedIDValues = "QE000001,QE000002,QE000003,QE000004,QE000005,QE000006,QE000007,QE000008,QE000009,QE000010,QE000011,QE000012,QE000013,QE000014,QE000015,QE000016,QE000017,QE000018,QE000019,QE000020,QE000021,QE000022,QE000023,QE000024,QE000025,QE000026,QE000027,QE000028,QE000031,QE000032,QE000033,QE000034,QE000035,QE000036,QE000037,QE000038,QE000039,QE000040,QE000041,QE000042,QE000043,QE000044,QE000045,QE000047,QE000048,QE000049,QE000050,QE000051,QE000052,QE000053,QE000054,QE000055,QE000056,QE000057,QE000058,QE000059,QE000060,QE000061,QE000062,QE000063,QE000064,QE000065,QE000066"
                cell1.Controls.Add(ctl1)

                ctl2.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Subject
                ctl2.StudentQualsOnEntryRowNumber = i
                ctl2.LabelWidth = 42
                cell2.Controls.Add(ctl2)

                ctl3.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Grade
                ctl3.StudentQualsOnEntryRowNumber = i
                ctl3.LabelWidth = 42
                ctl3.ExcludedIDValues = "Y,X,SU,SE,UH,TH,PPPP,PPPM,PPPD,PPMP,PPMM,PPMD,PPDP,PPDM,PPDD,PMPP,PMPM,PMPD,PMMP,PMMM,PMMD,PMDP,PMDM,PMDD,99,98,97,96,95,94,93,92,91,90,89,88,87,86,85,84,83,82,81,80,79,78,77,76,75,74,73,72,71,70,69,68,67,66,65,64,63,62,61,60,59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,09,08,07,06,05,04,03,02,01,PDPP,PDPM,PDPD,PDMP,PDMM,PDMD,PDDP,PDDM,PDDD,P,PPP,PPM,PPD,PP,PMP,PMM,PMD,PM,PDP,PDM,PDD,PD,PA,OTH,OR,NK,N,MPPP,MPPM,MPPD,MPMP,MPMM,MPMD,MPM,MPDP,MPDM,MPDD,MPD,MMPP,MMPM,MMPD,MMMP,MMMM,MMMD,MMDP,MMDM,MMDD,MMD,MPP,MP,MMP,MMM,MM,MD,ME,MDPP,MDPM,MDPD,MDP,MDMP,MDMM,MDMD,MDM,MDDP,MDDM,MDDD,MDD,M3,M2,M1,SL,GG,GF,GN,GE,GD,NONE,GC,GB,GA,G*,FO,FI,FG,FF,FE,FD,FC,FB,FL,FA,F*,EG,EF,EEE,EED,EEC,EEB,EEA,EE,EDE,EDD,EDC,EDB,EDA,ED,ECE,ECD,ECC,ECB,ECA,EC,EBE,EBD,EBC,EBB,EBA,EB,EAE,EAD,EAC,EAB,EAA,EA,E*,DPPP,DPPM,DPPD,DPMP,DPMM,DPMD,DPM,DPDP,DPDM,DPDD,DPD,DMPP,DMPM,DMPD,DMMP,DMMM,DMMD,DMDP,DMDM,DMDD,DMD,DPP,DP,DMP,DMM,DM,DDP,DDM,DDD,DS*,DS,L2,L1,LN,E3,DG,DF,DEE,DED,DEC,DEB,DEA,DE,DDPP,DDPM,DDPD,DDMP,DDMM,DDMD,DDE,DDDP,DDDM,DDDD,DDC,DDB,DDA,DD,DCE,DCD,DCC,DCB,DCA,DC,DBE,DBD,DBC,DBB,DBA,DB,DAE,DAD,DAC,DAB,DAA,DA,D3,D2,D1,D*,CR,CG,CF,CEE,CED,CEC,CEB,CEA,CE,CDE,CDD,CDC,CDB,CDA,CD,CCE,CCD,CCC,CCB,CCA,CC,CBE,CBD,CBC,CBB,CBA,CB,CAE,CAD,CAC,CAB,CAA,CA,C*,BG,BF,BEE,BED,BEC,BEB,BEA,BE,BDE,BDD,BDC,BDB,BDA,BCE,BCD,BCC,BCB,BCA,BC,BBE,BBD,BBC,BBB,BBA,BAE,BAD,BAC,BAB,BAA,BA,B*,BB,AG,AF,AEE,AED,AEC,AEB,AEA,AE,ADE,ADD,ADC,ADB,ADA,AD,EL3,EL2,EL1,ACE,ACD,ACC,ACB,ACA,AC,ABE,ABD,ABC,ABB,ABA,AB,AAE,AAD,AAC,AAB,AAA,AA*,AA,A*A*,A*A,*G,*F,*E,*D,*C,*B,*A,**,*,A A"
                'ctl3.ExcludedIDValues = "1,2,3,4,5,6,7,8,9,0" 'This would exclude certain grades from the drop down list
                cell3.Controls.Add(ctl3)

                ctl4.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.PredictedGrade
                ctl4.StudentQualsOnEntryRowNumber = i
                ctl4.LabelWidth = 167
                ctl4.ExcludedIDValues = "Y,X,SU,SE,UH,TH,PPPP,PPPM,PPPD,PPMP,PPMM,PPMD,PPDP,PPDM,PPDD,PMPP,PMPM,PMPD,PMMP,PMMM,PMMD,PMDP,PMDM,PMDD,99,98,97,96,95,94,93,92,91,90,89,88,87,86,85,84,83,82,81,80,79,78,77,76,75,74,73,72,71,70,69,68,67,66,65,64,63,62,61,60,59,58,57,56,55,54,53,52,51,50,49,48,47,46,45,44,43,42,41,40,39,38,37,36,35,34,33,32,31,30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,09,08,07,06,05,04,03,02,01,PDPP,PDPM,PDPD,PDMP,PDMM,PDMD,PDDP,PDDM,PDDD,P,PPP,PPM,PPD,PP,PMP,PMM,PMD,PM,PDP,PDM,PDD,PD,PA,OTH,OR,NK,N,MPPP,MPPM,MPPD,MPMP,MPMM,MPMD,MPM,MPDP,MPDM,MPDD,MPD,MMPP,MMPM,MMPD,MMMP,MMMM,MMMD,MMDP,MMDM,MMDD,MMD,MPP,MP,MMP,MMM,MM,MD,ME,MDPP,MDPM,MDPD,MDP,MDMP,MDMM,MDMD,MDM,MDDP,MDDM,MDDD,MDD,M3,M2,M1,SL,GG,GF,GN,GE,GD,NONE,GC,GB,GA,G*,FO,FI,FG,FF,FE,FD,FC,FB,FL,FA,F*,EG,EF,EEE,EED,EEC,EEB,EEA,EE,EDE,EDD,EDC,EDB,EDA,ED,ECE,ECD,ECC,ECB,ECA,EC,EBE,EBD,EBC,EBB,EBA,EB,EAE,EAD,EAC,EAB,EAA,EA,E*,DPPP,DPPM,DPPD,DPMP,DPMM,DPMD,DPM,DPDP,DPDM,DPDD,DPD,DMPP,DMPM,DMPD,DMMP,DMMM,DMMD,DMDP,DMDM,DMDD,DMD,DPP,DP,DMP,DMM,DM,DDP,DDM,DDD,DS*,DS,L2,L1,LN,E3,DG,DF,DEE,DED,DEC,DEB,DEA,DE,DDPP,DDPM,DDPD,DDMP,DDMM,DDMD,DDE,DDDP,DDDM,DDDD,DDC,DDB,DDA,DD,DCE,DCD,DCC,DCB,DCA,DC,DBE,DBD,DBC,DBB,DBA,DB,DAE,DAD,DAC,DAB,DAA,DA,D3,D2,D1,D*,CR,CG,CF,CEE,CED,CEC,CEB,CEA,CE,CDE,CDD,CDC,CDB,CDA,CD,CCE,CCD,CCC,CCB,CCA,CC,CBE,CBD,CBC,CBB,CBA,CB,CAE,CAD,CAC,CAB,CAA,CA,C*,BG,BF,BEE,BED,BEC,BEB,BEA,BE,BDE,BDD,BDC,BDB,BDA,BCE,BCD,BCC,BCB,BCA,BC,BBE,BBD,BBC,BBB,BBA,BAE,BAD,BAC,BAB,BAA,BA,B*,BB,AG,AF,AEE,AED,AEC,AEB,AEA,AE,ADE,ADD,ADC,ADB,ADA,AD,EL3,EL2,EL1,ACE,ACD,ACC,ACB,ACA,AC,ABE,ABD,ABC,ABB,ABA,AB,AAE,AAD,AAC,AAB,AAA,AA*,AA,A*A*,A*A,*G,*F,*E,*D,*C,*B,*A,**,*,A A"
                cell4.Controls.Add(ctl4)

                ctl5.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.DateAwarded
                ctl5.StudentQualsOnEntryRowNumber = i
                ctl5.LabelWidth = 90
                ctl5.CustomCaption = "Date"
                ctl5.CustomFieldType = CCCFieldType.Date
                cell5.Controls.Add(ctl5)

                row.Cells.AddRange({cell1, cell2, cell3, cell4, cell5})
                tblQuals.Rows.Add(row)

            Next

        End If


    End Sub
    Public Overrides Sub ValidateControl()



        MyBase.ValidateControl()
    End Sub

    'Public Overrides Sub RenderControl(writer As HtmlTextWriter)

    '    ''Render control for 1st Subject


    '    Dim ctlQuals As DropDownList = TryCast(StudentQualsOnEntryField17.InternalFieldControl, DropDownList)
    '    Dim ctlGrades As DropDownList = TryCast(StudentQualsOnEntryField18.InternalFieldControl, DropDownList)
    '    'Dim ctlPredictedGrades As DropDownList = TryCast(StudentQualsOnEntryField19.InternalFieldControl, DropDownList)

    '    ' Move all GCSE Grades to the top
    '    Dim indexGrade = 0
    '    For k As Integer = 0 To ctlGrades.Items.Count - 1 Step 1
    '        Dim item = ctlGrades.Items(k)
    '        Dim itemGradeName = item.Text

    '        ' Is this a GCSE Grade A*-G or 1-9?
    '        Select Case itemGradeName
    '            Case "A*", "A", "B", "C", "D", "E", "F", "G", "U",
    '                 "1", "2", "3", "4", "5", "6", "7", "8", "9"
    '                ' Remove the item and reinsert at top
    '                ctlGrades.Items.Remove(item)
    '                ctlGrades.Items.Insert(indexGrade, item)
    '                ' Increment index to maintain alpha sort
    '                indexGrade += 1
    '        End Select
    '    Next

    '    ' Move all GCSE Predicted Grades to the top
    '    ' Dim indexPredictedGrade = 0
    '    '  For k As Integer = 0 To ctlPredictedGrades.Items.Count - 1 Step 1
    '    ' Dim item = ctlPredictedGrades.Items(k)
    '    'Dim itemGradeName = item.Text

    '    ' Is this a GCSE Grade A*-G or 1-9?
    '    ' Select Case itemGradeName
    '    '  Case "A*", "A", "B", "C", "D", "E", "F", "G", "U",
    '    '     "1", "2", "3", "4", "5", "6", "7", "8", "9"
    '    ' Remove the item and reinsert at top
    '    '  ctlPredictedGrades.Items.Remove(item)
    '    ' ctlPredictedGrades.Items.Insert(indexPredictedGrade, item)
    '    ' Increment index to maintain alpha sort
    '    'indexPredictedGrade += 1
    '    '   End Select
    '    '   Next

    '    ' Move all GCSE Qualifications to the top
    '    Dim indexQual = 0
    '    For j As Integer = 0 To ctlQuals.Items.Count - 1 Step 1
    '        Dim item = ctlQuals.Items(j)
    '        Dim itemQualName = item.Text

    '        ' Is this a GCSE?
    '        If itemQualName.StartsWith("GCSE") Or String.IsNullOrWhiteSpace(itemQualName) Then
    '            ' Remove the item and reinsert at top
    '            ctlQuals.Items.Remove(item)
    '            ctlQuals.Items.Insert(indexQual, item)
    '            ' Increment index to maintain alpha sort
    '            indexQual += 1
    '        End If
    '    Next

    '    ' Reinsert blank entries at top
    '    Dim itemQualBlank = ctlQuals.Items.FindByValue("")
    '    ctlQuals.Items.Remove(itemQualBlank)
    '    ctlQuals.Items.Insert(0, itemQualBlank)

    '    Dim itemGradeBlank = ctlGrades.Items.FindByValue("")
    '    ctlGrades.Items.Remove(itemGradeBlank)
    '    ctlGrades.Items.Insert(0, itemGradeBlank)

    '    ' Dim itemPredictedGradeBlank = ctlPredictedGrades.Items.FindByValue("")
    '    ' ctlPredictedGrades.Items.Remove(itemPredictedGradeBlank)
    '    ' ctlPredictedGrades.Items.Insert(0, itemPredictedGradeBlank)


    '    ''Render control for 2nd object

    '    Dim ctlqual1 As DropDownList = TryCast(Qual.InternalFieldControl, DropDownList)
    '    Dim ctlgrades1 As DropDownList = TryCast(Grade.InternalFieldControl, DropDownList)
    '    ' Dim ctlpredictedgrades1 As DropDownList = TryCast(PredGrade.InternalFieldControl, DropDownList)

    '    ' Move all GCSE Grades to the top
    '    Dim indexGrade1 = 0
    '    For k As Integer = 0 To ctlgrades1.Items.Count - 1 Step 1
    '        Dim item1 = ctlgrades1.Items(k)
    '        Dim itemGradeName1 = item1.Text

    '        ' Is this a GCSE Grade A*-G or 1-9?
    '        Select Case itemGradeName1
    '            Case "A*", "A", "B", "C", "D", "E", "F", "G", "U",
    '                 "1", "2", "3", "4", "5", "6", "7", "8", "9"
    '                ' Remove the item and reinsert at top
    '                ctlgrades1.Items.Remove(item1)
    '                ctlgrades1.Items.Insert(indexGrade1, item1)
    '                ' Increment index to maintain alpha sort
    '                indexGrade1 += 1
    '        End Select
    '    Next

    '    ' Move all GCSE Predicted Grades to the top
    '    'Dim indexPredictedGrade1 = 0
    '    'For k As Integer = 0 To ctlpredictedgrades1.Items.Count - 1 Step 1
    '    '    Dim item1 = ctlpredictedgrades1.Items(k)
    '    '    Dim itemGradeName1 = item1.Text

    '    '    ' Is this a GCSE Grade A*-G or 1-9?
    '    '    Select Case itemGradeName1
    '    '        Case "A*", "A", "B", "C", "D", "E", "F", "G", "U",
    '    '             "1", "2", "3", "4", "5", "6", "7", "8", "9"
    '    '            ' Remove the item and reinsert at top
    '    '            ctlpredictedgrades1.Items.Remove(item1)
    '    '            ctlpredictedgrades1.Items.Insert(indexPredictedGrade1, item1)
    '    '            ' Increment index to maintain alpha sort
    '    '            indexPredictedGrade1 += 1
    '    '    End Select
    '    'Next

    '    ' Move all GCSE Qualifications to the top
    '    Dim indexQual1 = 0
    '    For j As Integer = 0 To ctlqual1.Items.Count - 1 Step 1
    '        Dim item1 = ctlqual1.Items(j)
    '        Dim itemQualName1 = item1.Text

    '        ' Is this a GCSE?
    '        If itemQualName1.StartsWith("GCSE") Or String.IsNullOrWhiteSpace(itemQualName1) Then
    '            ' Remove the item and reinsert at top
    '            ctlqual1.Items.Remove(item1)
    '            ctlqual1.Items.Insert(indexQual1, item1)
    '            ' Increment index to maintain alpha sort
    '            indexQual1 += 1
    '        End If
    '    Next

    '    ' Reinsert blank entries at top
    '    Dim itemQualBlank1 = ctlqual1.Items.FindByValue("")
    '    ctlqual1.Items.Remove(itemQualBlank1)
    '    ctlqual1.Items.Insert(0, itemQualBlank1)

    '    Dim itemGradeBlank1 = ctlgrades1.Items.FindByValue("")
    '    ctlgrades1.Items.Remove(itemGradeBlank1)
    '    ctlgrades1.Items.Insert(0, itemGradeBlank1)

    '    '  Dim itemPredictedGradeBlank1 = ctlpredictedgrades1.Items.FindByValue("")
    '    'ctlpredictedgrades1.Items.Remove(itemPredictedGradeBlank1)
    '    ' ctlpredictedgrades1.Items.Insert(0, itemPredictedGradeBlank1)




    '    MyBase.RenderControl(writer)


    'End Sub


    Public Property intCurrentQuals() As Integer
        Get
            Return CInt(HttpContext.Current.Session("intQualRows"))
        End Get
        Set(ByVal value As Integer)
            HttpContext.Current.Session("intQualRows") = value
        End Set
    End Property


    ''' <summary>
    ''' Save attachment in in-memory data table which we will be using to save in final step of the wizard.
    ''' </summary>
    ''' <param name="sender">sender</param>
    ''' <param name="e">e</param>
    Private Sub btnUpload_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpload.Click
        trNoItems.Visible = False
        Page.MaintainScrollPositionOnPostBack = True
        Me.Page.Validate()
        ''Following line is important to perform validations on File Upload control based on setup done on control.
        Me.fuAttachment.ValidateFile()

        If Not Me.Page.IsValid Then
            Return
        End If

        Dim rowAttachment = WorkingData.EnrolmentRequestAttachments.NewRow
        _lastAttachmentID -= 1
        With rowAttachment
            .AttachmentID = _lastAttachmentID
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


            'populate UDF

            Response.Redirect(GetResourceValue("checkout_makepayment_aspx"))
        End If

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

End Class
