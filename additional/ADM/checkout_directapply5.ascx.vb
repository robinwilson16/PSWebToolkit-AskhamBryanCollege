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


        End If

        If WorkingData.ApplicationRequestRow.ApplicationUserDefined2 <> "" Then
            rdoInterviewPref.SelectedValue = WorkingData.ApplicationRequestRow.ApplicationUserDefined2
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


        If rdoInterviewPref.SelectedValue = "" Then

            Dim v As New CustomValidator
            v.IsValid = False
            v.ErrorMessage = "Please answer If an interview is required as part of your application would you prefer"
            Me.Page.Validators.Add(v)
            rdoInterviewPref.Attributes.Add("border:", "1 px solid red;")

        End If

        'If Not chkConfirm.Checked Then

        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Please confirm the declaration"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)

        'End If







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



        Dim rowH As New TableRow

        Dim c1, c2, c3, c4, c5 As New TableCell
        c1.Text = "Qualification"
        c1.Attributes.Add("class", "text=center")
        c2.Text = "Subject"
        c3.Text = "Actual Grade"
        c4.Text = "Predicted Grade"
        c5.Text = "Date Awarded"
        rowH.Cells.AddRange({c1, c2, c3, c4, c5})

        tblQuals.Rows.Add(rowH)

        If IsPostBack Then
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

        If slidingdiv.Visible Then

            For i = 0 To intCurrentQuals
                Dim row As New TableRow
                Dim cell1, cell2, cell3, cell4, cell5 As New TableCell
                Dim ctl1, ctl2, ctl3, ctl4, ctl5 As New StudentQualsOnEntryField


                ctl1.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.QualID
                ctl1.StudentQualsOnEntryRowNumber = i
                ctl1.LabelWidth = 0
                cell1.Controls.Add(ctl1)

                ctl2.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Subject
                ctl2.StudentQualsOnEntryRowNumber = i
                ctl2.LabelWidth = 0
                cell2.Controls.Add(ctl2)

                ctl3.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.Grade
                ctl3.StudentQualsOnEntryRowNumber = i
                ctl3.LabelWidth = 0
                '   ctl3.ExcludedIDValues = "4,	C,	*,	**,	*A,	*B,	*C,	*D,	*E,	*F,	*G,	0,	1,	2,	3,	4,	5,	6,	7,	8,	9,	10,	11,	12,	13,	14,	15,	16,	17,	18,	19,	20,	21,	22,	23,	24,	25,	26,	27,	28,	29,	30,	31,	32,	33,	34,	35,	36,	37,	38,	39,	4,	40,	41,	42,	43,	44,	45,	46,	47,	48,	49,	50,	51,	52,	53,	54,	55,	56,	57,	58,	59,	60,	61,	62,	63,	64,	65,	66,	67,	68,	69,	70,	71,	72,	73,	74,	75,	76,	77,	78,	79,	80,	81,	82,	83,	84,	85,	86,	87,	88,	89,	90,	91,	92,	93,	94,	95,	96,	97,	98,	99,	A,	A,	A*A,	A*A*,	AA,	AA*,	AAA,	AAB,	AAC,	AAD,	AAE,	AB,	ABA,	ABB,	ABC,	ABD,	ABE,	AC,	ACA,	ACB,	ACC,	ACD,	ACE,	AD,	ADA,	ADB,	ADC,	ADD,	ADE,	AE,	AEA,	AEB,	AEC,	AED,	AEE,	AF,	AG,	B*,	BA,	BAA,	BAB,	BAC,	BAD,	BAE,	BB,	BBA,	BBB,	BBC,	BBD,	BBE,	BC,	BCA,	BCB,	BCC,	BCD,	BCE,	BDA,	BDB,	BDC,	BDD,	BDE,	BE,	BEA,	BEB,	BEC,	BED,	BEE,	BF,	BG,	C*,	CA,	CAA,	CAB,	CAC,	CAD,	CAE,	CB,	CBA,	CBB,	CBC,	CBD,	CBE,	CC,	CCA,	CCB,	CCC,	CCD,	CCE,	CD,	CDA,	CDB,	CDC,	CDD,	CDE,	CE,	CEA,	CEB,	CEC,	CED,	CEE,	CF,	CG,	CR,	D*,	D*D*D*,	D1,	D2,	D3,	DA,	DAA,	DAB,	DAC,	DAD,	DAE,	DB,	DBA,	DBB,	DBC,	DBD,	DBE,	DC,	DCA,	DCB,	DCC,	DCD,	DCE,	DD,	DD*,	DD*D*,	DDA,	DDB,	DDC,	DDD,	DDD*,	DDDD,	DDDM,	DDDP,	DDE,	DDM,	DDMD,	DDMM,	DDMP,	DDP,	DDPD,	DDPM,	DDPP,	DE,	DEA,	DEB,	DEC,	DED,	DEE,	DF,	DG,	DM,	DMD,	DMDD,	DMDM,	DMDP,	DMM,	DMMD,	DMMM,	DMMP,	DMP,	DMPD,	DMPM,	DMPP,	DP,	DPD,	DPDD,	DPDM,	DPDP,	DPM,	DPMD,	DPMM,	DPMP,	DPP,	DPPD,	DPPM,	DPPP,	DS*,	E*,	E3P,	EA,	EAA,	EAB,	EAC,	EAD,	EAE,	EB,	EBA,	EBB,	EBC,	EBD,	EBE,	EC,	ECA,	ECB,	ECC,	ECD,	ECE,	ED,	EDA,	EDB,	EDC,	EDD,	EDE,	EE,	EEA,	EEB,	EEC,	EED,	EEE,	EF,	EG,	EL1,	EL2,	EL3,	F*,	FA,	FB,	FC,	FD,	FE,	FF,	FG,	FI,	FL,	FO,	G*,	GA,	GB,	GC,	GD,	GE,	GF,	GG,	GN,	L1P,	L2P,	M1,	M2,	M3,	MD,	MDD,	MDDD,	MDDM,	MDDP,	MDM,	MDMD,	MDMM,	MDMP,	MDP,	MDPD,	MDPM,	MDPP,	MM,	MMD,	MMDD,	MMDM,	MMDP,	MMM,	MMMD,	MMMM,	MMMP,	MMP,	MMPD,	MMPM,	MMPP,	MP,	MPD,	MPDD,	MPDM,	MPDP,	MPM,	MPMD,	MPMM,	MPMP,	MPP,	MPPD,	MPPM,	MPPP,	N,	NK,	NONE,	OR,	PA,	PD,	PDD,	PDDD,	PDDM,	PDDP,	PDM,	PDMD,	PDMM,	PDMP,	PDP,	PDPD,	PDPM,	PDPP,	PM,	PMD,	PMDD,	PMDM,	PMDP,	PMM,	PMMD,	PMMM,	PMMP,	PMP,	PMPD,	PMPM,	PMPP,	PP,	PPD,	PPDD,	PPDM,	PPDP,	PPM,	PPMD,	PPMM,	PPMP,	PPP,	PPPD,	PPPM,	PPPP,	SE,	SL,	SU,	TH,	U,	UH,	X,	Y" 'This would exclude certain grades from the drop down list
                cell3.Controls.Add(ctl3)

                ctl4.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.PredictedGrade
                ctl4.StudentQualsOnEntryRowNumber = i
                ctl4.LabelWidth = 0
                ' ctl4.ExcludedIDValues = "4,	C,	*,	**,	*A,	*B,	*C,	*D,	*E,	*F,	*G,	0,	1,	2,	3,	4,	5,	6,	7,	8,	9,	10,	11,	12,	13,	14,	15,	16,	17,	18,	19,	20,	21,	22,	23,	24,	25,	26,	27,	28,	29,	30,	31,	32,	33,	34,	35,	36,	37,	38,	39,	4,	40,	41,	42,	43,	44,	45,	46,	47,	48,	49,	50,	51,	52,	53,	54,	55,	56,	57,	58,	59,	60,	61,	62,	63,	64,	65,	66,	67,	68,	69,	70,	71,	72,	73,	74,	75,	76,	77,	78,	79,	80,	81,	82,	83,	84,	85,	86,	87,	88,	89,	90,	91,	92,	93,	94,	95,	96,	97,	98,	99,	A,	A,	A*A,	A*A*,	AA,	AA*,	AAA,	AAB,	AAC,	AAD,	AAE,	AB,	ABA,	ABB,	ABC,	ABD,	ABE,	AC,	ACA,	ACB,	ACC,	ACD,	ACE,	AD,	ADA,	ADB,	ADC,	ADD,	ADE,	AE,	AEA,	AEB,	AEC,	AED,	AEE,	AF,	AG,	B*,	BA,	BAA,	BAB,	BAC,	BAD,	BAE,	BB,	BBA,	BBB,	BBC,	BBD,	BBE,	BC,	BCA,	BCB,	BCC,	BCD,	BCE,	BDA,	BDB,	BDC,	BDD,	BDE,	BE,	BEA,	BEB,	BEC,	BED,	BEE,	BF,	BG,	C*,	CA,	CAA,	CAB,	CAC,	CAD,	CAE,	CB,	CBA,	CBB,	CBC,	CBD,	CBE,	CC,	CCA,	CCB,	CCC,	CCD,	CCE,	CD,	CDA,	CDB,	CDC,	CDD,	CDE,	CE,	CEA,	CEB,	CEC,	CED,	CEE,	CF,	CG,	CR,	D*,	D*D*D*,	D1,	D2,	D3,	DA,	DAA,	DAB,	DAC,	DAD,	DAE,	DB,	DBA,	DBB,	DBC,	DBD,	DBE,	DC,	DCA,	DCB,	DCC,	DCD,	DCE,	DD,	DD*,	DD*D*,	DDA,	DDB,	DDC,	DDD,	DDD*,	DDDD,	DDDM,	DDDP,	DDE,	DDM,	DDMD,	DDMM,	DDMP,	DDP,	DDPD,	DDPM,	DDPP,	DE,	DEA,	DEB,	DEC,	DED,	DEE,	DF,	DG,	DM,	DMD,	DMDD,	DMDM,	DMDP,	DMM,	DMMD,	DMMM,	DMMP,	DMP,	DMPD,	DMPM,	DMPP,	DP,	DPD,	DPDD,	DPDM,	DPDP,	DPM,	DPMD,	DPMM,	DPMP,	DPP,	DPPD,	DPPM,	DPPP,	DS*,	E*,	E3P,	EA,	EAA,	EAB,	EAC,	EAD,	EAE,	EB,	EBA,	EBB,	EBC,	EBD,	EBE,	EC,	ECA,	ECB,	ECC,	ECD,	ECE,	ED,	EDA,	EDB,	EDC,	EDD,	EDE,	EE,	EEA,	EEB,	EEC,	EED,	EEE,	EF,	EG,	EL1,	EL2,	EL3,	F*,	FA,	FB,	FC,	FD,	FE,	FF,	FG,	FI,	FL,	FO,	G*,	GA,	GB,	GC,	GD,	GE,	GF,	GG,	GN,	L1P,	L2P,	M1,	M2,	M3,	MD,	MDD,	MDDD,	MDDM,	MDDP,	MDM,	MDMD,	MDMM,	MDMP,	MDP,	MDPD,	MDPM,	MDPP,	MM,	MMD,	MMDD,	MMDM,	MMDP,	MMM,	MMMD,	MMMM,	MMMP,	MMP,	MMPD,	MMPM,	MMPP,	MP,	MPD,	MPDD,	MPDM,	MPDP,	MPM,	MPMD,	MPMM,	MPMP,	MPP,	MPPD,	MPPM,	MPPP,	N,	NK,	NONE,	OR,	PA,	PD,	PDD,	PDDD,	PDDM,	PDDP,	PDM,	PDMD,	PDMM,	PDMP,	PDP,	PDPD,	PDPM,	PDPP,	PM,	PMD,	PMDD,	PMDM,	PMDP,	PMM,	PMMD,	PMMM,	PMMP,	PMP,	PMPD,	PMPM,	PMPP,	PP,	PPD,	PPDD,	PPDM,	PPDP,	PPM,	PPMD,	PPMM,	PPMP,	PPP,	PPPD,	PPPM,	PPPP,	SE,	SL,	SU,	TH,	U,	UH,	X,	Y" 'This would exclude certain grades from the drop down list

                cell4.Controls.Add(ctl4)

                ctl5.StudentQualsOnEntryFieldType = StudentQualsOnEntryFieldType.DateAwarded
                ctl5.StudentQualsOnEntryRowNumber = i
                ctl5.LabelWidth = 0
                ctl5.CustomFieldType = CCCFieldType.Date
                cell5.Controls.Add(ctl5)

                row.Cells.AddRange({cell1, cell2, cell3, cell4, cell5})
                tblQuals.Rows.Add(row)

            Next
        End If



    End Sub



    Private Sub CheckData()

        If rdoInterviewPref.SelectedValue <> "" Then
            WorkingData.ApplicationRequestRow.ApplicationUserDefined2 = rdoInterviewPref.SelectedValue

        End If
    End Sub



    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click


        Dim redirectString As String = String.Empty

        Me.Page.Validate()


        If Me.Page.IsValid Then


            CheckData()


            redirectString = GetResourceValue("checkout_directapply6_aspx")
            Response.Redirect(redirectString)

        End If



    End Sub


    Protected Sub btnBack_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnBack.Click


        Dim redirectString As String = String.Empty

        Me.Page.Validate()


        If Me.Page.IsValid Then


            CheckData()


            redirectString = GetResourceValue("checkout_directapply4_aspx")
            Response.Redirect(redirectString)

        End If



    End Sub


End Class
