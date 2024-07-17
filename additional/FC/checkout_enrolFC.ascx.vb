Option Explicit Off
Option Strict Off
Imports System.Collections.Generic
Imports System.IO
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class checkout_directapply
    Inherits webenrolmentcontrolvalidate

    Public MainOfferingID As Integer
    Public OfferingRow As OfferingRow
    Public CourseFee As OfferingFeeRow

    Public ShowTeamList As Boolean = False
    Public ShowCourseList As Boolean = False
    Public HasFormErrors As Boolean = False

    Public Teams As IList(Of Team)
    Public Team As Team
    Public Courses As IList(Of Course)
    Public Course As Course
    Public Search As String
    Public CourseAction As String
    Public ShowBackButton As Boolean = False

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

    Public ReadOnly Property TeamCode() As String
        Get
            Return Me.Page.Request("Dept")
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

        CourseAction = "Enrol"

        'Show back button if arrived here from search
        If Not IsNothing(Request.UrlReferrer) Then
            If Request.UrlReferrer.ToString.Contains("Dept=") Or Request.UrlReferrer.ToString.Contains("Search=") Then
                ShowBackButton = True
            End If
        End If

        Search = Request.QueryString("Search")
        If Not IsPostBack Then
            If Len(Search) > 0 Then
                SearchDept1.Value = Search
                SearchDept2.Value = Search
            End If
        End If

        If OfferingID() > 0 Then
            MainOfferingID = GetProSolutionData.GetOfferingID()

            OfferingRow = OfferingDataTable.FetchByOfferingID(MainOfferingID)

            If Not IsNothing(OfferingRow) Then
                CourseFee = OfferingFeeDataTableAdapter.GetOfferingFeeRow(CInt(OfferingRow.OfferingID), 1, 0)
            Else
                CourseFee = Nothing
            End If

            'Another bug where aim title is not available in toolkit so get from other system
            Try
                Course = GetProSolutionData.GetCourseByID(MainOfferingID)
            Catch ex As Exception

            End Try

            'WorkingData.EnrolmentRequestRow.Title = "Mr"
            'WorkingData.EnrolmentRequestRow.Surname = "test"
            'WorkingData.ApplicationRequestRow.ApplicationTypeID = "1"
            'WorkingData.ApplicationRequestRow.ApplicationUserDefined2 = "York"
            'WorkingData.ApplicationRequestRow.ApplicationUserDefined3 = "Hort"
            'WorkingData.EnrolmentRequestRow.PriorAttainmentLevelID = "01"
            'WorkingData.EnrolmentRequestRow.FirstForename = "Test"
            'WorkingData.EnrolmentRequestRow.DateOfBirth = "30/08/2002"
            'WorkingData.EnrolmentRequestRow.Sex = "F"
            'WorkingData.EnrolmentRequestRow.Address1 = "317"
            'WorkingData.EnrolmentRequestRow.Address2 = "Test Road"
            'WorkingData.EnrolmentRequestRow.Address3 = "Test Road"
            'WorkingData.EnrolmentRequestRow.Address4 = "Test Road"
            'WorkingData.EnrolmentRequestRow.PostcodeOut = "EH20"
            'WorkingData.EnrolmentRequestRow.PostcodeIn = "1BF"
            'WorkingData.EnrolmentRequestRow.Email = "a@a.com"
            'WorkingData.EnrolmentRequestRow.MobileTel = "07853318366"
            ''Response.Write(SQLDBDataReader.GetString(7))

            Session("RequestMode") = RequestMode.EnrolmentRequest


            If Not IsPostBack Then

                PutAllOfferingsInBasket()
                PopulateOfferingFeeTable()
            Else
                Response.Write("B")


                Page.MaintainScrollPositionOnPostBack = True
            End If

        ElseIf Len(Search) > 0 Then
            ShowCourseList = True

            Teams = GetProSolutionData.GetTeams()
            If Not String.IsNullOrEmpty(TeamCode) Then
                If CourseAction = "Enquire" Then
                    Courses = GetProSolutionData.GetCoursesSearchEnquire(TeamCode, Search)
                ElseIf CourseAction = "Apply" Then
                    Courses = GetProSolutionData.GetCoursesSearchApply(TeamCode, Search)
                ElseIf CourseAction = "Enrol" Then
                    Courses = GetProSolutionData.GetCoursesSearchEnrol(TeamCode, Search)
                Else
                    Courses = GetProSolutionData.GetCoursesSearchApply(TeamCode, Search)
                End If
            Else
                If CourseAction = "Enquire" Then
                    Courses = GetProSolutionData.GetCoursesSearchEnquire(Search)
                ElseIf CourseAction = "Apply" Then
                    Courses = GetProSolutionData.GetCoursesSearchApply(Search)
                ElseIf CourseAction = "Enrol" Then
                    Courses = GetProSolutionData.GetCoursesSearchEnrol(Search)
                Else
                    Courses = GetProSolutionData.GetCoursesSearchApply(Search)
                End If
            End If

        ElseIf String.IsNullOrEmpty(TeamCode) Then
            ShowTeamList = True

            'Code that does not work in Web Toolkit that should return course list
            'AllCourses = OfferingDataTable.SearchForOfferings("24/25", "", "", "", "", "", "", "", "2", "", "", "")

            If CourseAction = "Enquire" Then
                Teams = GetProSolutionData.GetTeamsEnquire()
            ElseIf CourseAction = "Apply" Then
                Teams = GetProSolutionData.GetTeamsApply()
            ElseIf CourseAction = "Enrol" Then
                Teams = GetProSolutionData.GetTeamsEnrol()
            Else
                Teams = GetProSolutionData.GetTeamsApply()
            End If
        Else
            ShowCourseList = True

            If Not (String.IsNullOrEmpty(TeamCode)) Then
                Team = GetProSolutionData.GetTeamByCode(TeamCode)

                If CourseAction = "Enquire" Then
                    Courses = GetProSolutionData.GetCoursesEnquire(TeamCode)
                ElseIf CourseAction = "Apply" Then
                    Courses = GetProSolutionData.GetCoursesApply(TeamCode)
                ElseIf CourseAction = "Enrol" Then
                    Courses = GetProSolutionData.GetCoursesEnrol(TeamCode)
                Else
                    Courses = GetProSolutionData.GetCoursesApply(TeamCode)
                End If
            Else
                If CourseAction = "Enquire" Then
                    Teams = GetProSolutionData.GetTeamsEnquire()
                    Courses = GetProSolutionData.GetCoursesEnquire()
                ElseIf CourseAction = "Apply" Then
                    Teams = GetProSolutionData.GetTeamsApply()
                    Courses = GetProSolutionData.GetCoursesApply()
                ElseIf CourseAction = "Enrol" Then
                    Teams = GetProSolutionData.GetTeamsEnrol()
                    Courses = GetProSolutionData.GetCoursesEnrol()
                Else
                    Teams = GetProSolutionData.GetTeamsApply()
                    Courses = GetProSolutionData.GetCoursesApply()
                End If
            End If
        End If

        RepeaterTeams.DataSource = Teams
        RepeaterTeams.DataBind()

        RepeaterCourses.DataSource = Courses
        RepeaterCourses.DataBind()
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
            Response.Write(tblOffering1(0).WebSiteAvailabilityID.HasValue)
            If tblOffering1.Count > 0 AndAlso tblOffering1(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering1(0)


                    ' item.Cost = .TotalFeeAmount.Value
                    'Response.Write(.TotalFeeAmount.Value)

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
            'Response.Write("A")
            Dim tblOffering As New OfferingDataTable
            Dim v As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataView(tblOffering)
            v.Columns.AddPKColumns()
            v.Columns.EnsureColumnsAreSelected(True, False, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.CourseInformationIDColumn, tblOffering.TotalFeeAmountColumn, tblOffering.OfferingTypeIDColumn)
            v.Filters.SetColumnFilter(tblOffering.OfferingIDColumn, intOfferingID)
            tblOffering.TableAdapter.Load(tblOffering, v)



            If tblOffering.Count > 0 AndAlso tblOffering(0).WebSiteAvailabilityID.HasValue Then
                Dim item As New ShoppingCartItem()
                With tblOffering(0)
                    'Response.Write(.TotalFeeAmount.Value)
                    item.Cost = .TotalFeeAmount.Value


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


        'If Not chkConfirm.Checked Then

        '    Dim v As New CustomValidator
        '    v.ErrorMessage = "Please confirm the declaration"
        '    v.IsValid = False
        '    Me.Page.Validators.Add(v)

        'End If
        'Title
        'If Not IsNothing(fldTitle) Then
        '    If String.IsNullOrEmpty(fldTitle.Value) Then
        '        fldTitleValidator.ErrorMessage = "Title must not be blank"
        '        fldTitleValidator.IsValid = False
        '        fldTitleValidator.CssClass = "error alert alert-danger"
        '        fldTitle.CssClass = "ErrorInput"
        '    End If
        'End If

        'Gender
        If Not IsNothing(fldGender) Then
            If String.IsNullOrEmpty(fldGender.Value) Then
                fldGenderValidator.ErrorMessage = "Legal Gender must not be blank"
                fldGenderValidator.IsValid = False
                fldGenderValidator.CssClass = "error alert alert-danger"
                fldGender.CssClass = "ErrorInput"
            End If
        End If

        'Preferred Pronoun
        If Not IsNothing(fldPronoun) Then
            If String.IsNullOrEmpty(fldPronoun.Value) Then
                fldPronounValidator.ErrorMessage = "Preferred Pronoun must not be blank"
                fldPronounValidator.IsValid = False
                fldPronounValidator.CssClass = "error alert alert-danger"
                fldPronoun.CssClass = "ErrorInput"
            End If
        End If

        MyBase.ValidateControl()
    End Sub



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



    Private Sub CheckData()

        'Dim refDate As Date = "31/08/2023"

        'If IsDate(WorkingData.EnrolmentRequestRow.DateOfBirth) Then
        '    ' Session("age") = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), refDate) / 365.25)
        '    WorkingData.EnrolmentRequestRow.StudentDetailUserDefined1 = Math.Floor(DateDiff(DateInterval.Day, CType(WorkingData.EnrolmentRequestRow.DateOfBirth, Date), refDate) / 365.25)

        'End If


    End Sub


    Protected Sub btnContinue_click(ByVal sender As Object, ByVal e As EventArgs) Handles btnContinue.Click


        Dim redirectString As String = String.Empty

        Me.Page.Validate()

        If Me.Page.IsValid Then
            WorkingData.EnrolmentRequestRow.Surname = Trim(fldSurname.Value.ToString)
            WorkingData.EnrolmentRequestRow.FirstForename = Trim(fldFirstName.Value.ToString)

            CheckData()

            redirectString = GetResourceValue("checkout_enrolFC2_aspx")
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

    Public Sub SearchButton_Click(sender As Object, e As System.EventArgs) _
        Handles SearchButton1.Click, SearchButton2.Click

        'Dim resource = Global.Resources.Resource.courseapply_abc
        Dim resource = HttpContext.Current.Request.Url.AbsoluteUri
        Dim url As String = ""

        Dim btn As LinkButton = CType(sender, LinkButton)

        If btn.ID = "SearchButton1" Then
            If Len(SearchDept1.Value) > 0 Then
                url = resource & "&Search=" & SearchDept1.Value
            Else
                url = resource
            End If
        ElseIf btn.ID = "SearchButton2" Then
            If Len(SearchDept2.Value) > 0 Then
                url = resource & "&Search=" & SearchDept2.Value
            Else
                url = resource
            End If
        Else
            url = resource
        End If

        If Len(url) > 0 Then
            Response.Redirect(url)
        End If
    End Sub

    Public Sub NoCoursesFoundButton_Click(sender As Object, e As System.EventArgs) _
        Handles NoCoursesFoundButton.ServerClick

        'Dim resource = Global.Resources.Resource.courseapply_abc
        'Dim resource = HttpContext.Current.Request.Url.AbsoluteUri
        Dim resource = HttpContext.Current.Request.Url.AbsolutePath

        'Remove query string element in case already in URL
        Dim queryString = HttpUtility.ParseQueryString(HttpContext.Current.Request.Url.Query)
        queryString.Remove("Search")
        queryString.Remove("Dept")

        Dim url As String = ""

        url = resource & "?" & queryString.ToString()

        If Len(url) > 0 Then
            Response.Redirect(url)
        End If
    End Sub

    Public Sub Team_Click(sender As Object, e As System.EventArgs)

        Dim btn As LinkButton = DirectCast(sender, LinkButton)

        'Dim resource = Global.Resources.Resource.courseapply_abc
        'Dim resource = HttpContext.Current.Request.Url.AbsoluteUri
        Dim resource = HttpContext.Current.Request.Url.AbsolutePath

        'Remove query string element in case already in URL
        Dim queryString = HttpUtility.ParseQueryString(HttpContext.Current.Request.Url.Query)
        queryString.Remove("Dept")

        Dim url As String = ""

        url = resource & "?" & queryString.ToString()

        If Not IsNothing(btn.CommandArgument) Then
            url += "&Dept=" & btn.CommandArgument.ToString()
        End If

        If Len(url) > 0 Then
            Response.Redirect(url)
        End If
    End Sub

    Public Sub Course_Click(sender As Object, e As System.EventArgs)

        Dim btn As LinkButton = DirectCast(sender, LinkButton)

        'Dim resource = Global.Resources.Resource.courseapply_abc
        'Dim resource = HttpContext.Current.Request.Url.AbsoluteUri
        Dim resource = HttpContext.Current.Request.Url.AbsolutePath

        'Remove query string element in case already in URL
        Dim queryString = HttpUtility.ParseQueryString(HttpContext.Current.Request.Url.Query)
        queryString.Remove("OfferingID")

        Dim url As String = ""

        url = resource & "?" & queryString.ToString()

        If Not IsNothing(btn.CommandArgument) Then
            url += "&OfferingID=" & btn.CommandArgument.ToString()
        End If

        If Len(url) > 0 Then
            Response.Redirect(url)
        End If
    End Sub
End Class
