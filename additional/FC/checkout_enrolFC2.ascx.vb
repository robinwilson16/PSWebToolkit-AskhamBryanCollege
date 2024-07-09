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

        Session("RequestMode") = RequestMode.ApplicationRequest
        If WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = "Apps" Then
            NINum.Visible = True
        End If

        If Not IsPostBack Then

            PutAllOfferingsInBasket()
            PopulateOfferingFeeTable()

            If WorkingData.ApplicationRequestRow.PostcodeIn <> "" Then


                postcode.Value = WorkingData.ApplicationRequestRow.PostcodeOut & " " & WorkingData.ApplicationRequestRow.PostcodeIn

            End If




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
                postcode.Value = WorkingData.ApplicationRequestRow.PostcodeOut & " " & WorkingData.ApplicationRequestRow.PostcodeIn
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


                    '     item.Cost = 0


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



        'If Len(txtAddress1.Value) = 0 Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "You must enter the 1st line of the address"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If

        'Post Code
        Dim regexPostCode As New Regex("^([Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9][A-Za-z]?))))\s?[0-9][A-Za-z]{2})$")
        If Not IsNothing(postcode) Then
            Dim match As Match = regexPostCode.Match(postcode.Value)
            If Not match.Success Then
                postcodeValidator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> Please enter a valid Postcode"
                postcodeValidator.IsValid = False
                postcode.Attributes.Add("Class", "textfield form-control ErrorInput")
            End If
        End If

        '''lewis @adnvanced
        'Dim regexEmail As New Regex("^[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?$")
        'Dim matchE As Match = regexEmail.Match(fldEmail.Value)
        'If Not matchE.Success Then
        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Please enter a valid email"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)
        'End If


        If WorkingData.EnrolmentRequestRow.MobileTel = "" And WorkingData.EnrolmentRequestRow.Tel = "" Then
            Dim v As New CustomValidator
            v.ErrorMessage = "Please enter at least one phone number (Mobile number / Home phone (inc. STD code))"
            v.IsValid = False
            Me.Page.Validators.Add(v)
            txtMobile.Style.Add("border", "1px solid red")
        End If

        If WorkingData.EnrolmentRequestRow.MobileTel = WorkingData.EnrolmentRequestRow.ParentMobileTel Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must provide a different emergency contact number to your own mobile number " + WorkingData.EnrolmentRequestRow.MobileTel
            v.IsValid = False
            Me.Page.Validators.Add(v)

        End If

        If WorkingData.EnrolmentRequestRow.Email = WorkingData.EnrolmentRequestRow.ParentEmailAddress Then
            Dim v As New CustomValidator
            v.ErrorMessage = "You must provide a different emergency email address to your own email address " + WorkingData.EnrolmentRequestRow.Email
            v.IsValid = False
            Me.Page.Validators.Add(v)

        End If

        If RadioButtonListAlt.SelectedValue = "" Then
            Dim a As New CustomValidator
            a.IsValid = False
            a.ErrorMessage = "Is your term time address different to your home address? must not be blank"
            Me.Page.Validators.Add(a)
            RadioButtonListAlt.Style.Add("border", "1px solid red")
        End If

        Dim startDate As Date = "02/09/2023"
        Dim refDate As Date = "31/08/2023"

        If IsDate(WorkingData.EnrolmentRequestRow.DateOfBirth) Then
            ' Session("age") = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), refDate) / 365.25)
            WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), refDate) / 365.25)
            If IsDate(startDate) Then
                'Session("agecourse") = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), startDate) / 365.25)
                WorkingData.EnrolmentRequestRow.StudentDetailUserDefined2 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), startDate) / 365.25)
            End If
        End If

        Dim matchAltPostcode As Match = regexPostCode.Match(AltPostcode.Value)
        If Not IsNothing(RadioButtonListAlt) Then
            If RadioButtonListAlt.SelectedValue = "1" Then
                If Not IsNothing(AltAddress1) Then
                    If String.IsNullOrEmpty(AltAddress1.Value.ToString) Then
                        AltAddress1Validator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> As you have said your term time address is different please enter the house number and street"
                        AltAddress1Validator.IsValid = False
                        AltAddress1Validator.CssClass = "error alert alert-danger"
                        AltAddress1.CssClass = "ErrorInput"
                    End If
                End If

                If Not IsNothing(AltPostcode) Then
                    If String.IsNullOrEmpty(AltPostcode.Value.ToString) Then
                        AltPostcodeValidator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> As you have said your term time address is different please enter the post code"
                        AltPostcodeValidator.IsValid = False
                        AltPostcodeValidator.CssClass = "error alert alert-danger"
                        AltPostcode.Attributes.Add("Class", "textfield form-control ErrorInput")
                    ElseIf Not matchAltPostcode.Success Then
                        AltPostcodeValidator.ErrorMessage = "<i class=""fa-solid fa-triangle-exclamation""></i> Please enter a valid post code for your term time address"
                        AltPostcodeValidator.IsValid = False
                        AltPostcodeValidator.CssClass = "error alert alert-danger"
                        AltPostcode.Attributes.Add("Class", "textfield form-control ErrorInput")
                    End If
                End If
            End If
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

        'If IsPostBack Then
        If Not String.IsNullOrEmpty(Session("RadioButtonListAlt")) Then
            RadioButtonListAlt.SelectedValue = Session("RadioButtonListAlt")
        End If
        'End If
    End Sub



    Private Sub CheckData()



        WorkingData.ApplicationRequestRow.Address1 = fldAddress1.Value
        WorkingData.ApplicationRequestRow.Address2 = fldAddress2.Value
        WorkingData.ApplicationRequestRow.Address3 = fldAddress3.Value
        WorkingData.ApplicationRequestRow.Address4 = fldAddress4.Value

        'postcode stuff            
        ''CCCPS-77326: Setting flag to false so Main Address screen opens when coming from this page.
        PSWebEnrolmentProperties.IsCurrentlyTakingAltAddress = False
        If Len(postcode.Value.Trim) > 0 Then
            WorkingData.EnrolmentRequestRow.PostcodeOut = postcode.Value.Trim.Substring(0, postcode.Value.Trim.Length - 3).Trim
            WorkingData.EnrolmentRequestRow.PostcodeIn = Right(postcode.Value.Trim, 3).Trim

            WorkingData.ApplicationRequestRow.PostcodeOut = postcode.Value.Trim.Substring(0, postcode.Value.Trim.Length - 3).Trim
            WorkingData.ApplicationRequestRow.PostcodeIn = Right(postcode.Value.Trim, 3).Trim
        End If

        If Len(AltPostcode.Value.Trim) > 0 Then
            WorkingData.EnrolmentRequestRow.AltPostcodeOut = AltPostcode.Value.Trim.Substring(0, AltPostcode.Value.Trim.Length - 3).Trim
            WorkingData.EnrolmentRequestRow.AltPostcodeIn = Right(AltPostcode.Value.Trim, 3).Trim

            WorkingData.ApplicationRequestRow.AltPostcodeOut = AltPostcode.Value.Trim.Substring(0, AltPostcode.Value.Trim.Length - 3).Trim
            WorkingData.ApplicationRequestRow.AltPostcodeIn = Right(AltPostcode.Value.Trim, 3).Trim
        End If



        'WorkingData.ApplicationRequestRow.EuroResidentID = CType(RadioButtonListEU.SelectedValue, Boolean?)

    End Sub

    Private Sub RadioButtonListAlt_Change(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioButtonListAlt.SelectedIndexChanged
        If RadioButtonListAlt.SelectedValue = 2 Then
            WorkingData.EnrolmentRequest(0).AltPostcodeOut = ""
            WorkingData.EnrolmentRequest(0).AltPostcodeIn = ""
        End If
    End Sub

    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click


        Dim redirectString As String = String.Empty

        'Store custom field values in session
        Session("RadioButtonListAlt") = RadioButtonListAlt.SelectedValue.ToString

        Me.Page.Validate()


        If Me.Page.IsValid Then


            CheckData()


            redirectString = GetResourceValue("checkout_enrolFC3_aspx")
            Response.Redirect(redirectString)

        End If



    End Sub


    Protected Sub btnBack_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnBack.Click


        Dim redirectString As String = String.Empty

        'Me.Page.Validate()


        'If Me.Page.IsValid Then


        CheckData()


            redirectString = GetResourceValue("checkout_enrolFC_aspx")
            Response.Redirect(redirectString)

        'End If



    End Sub


End Class
