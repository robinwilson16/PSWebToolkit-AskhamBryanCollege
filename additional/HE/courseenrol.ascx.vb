Option Explicit On
Option Strict On

Imports System.Collections.Generic
Imports CompassCC.CCCSystem.CCCCommon
Imports CompassCC.ProSolution.PSWebEnrolmentKit

Partial Class courseenrol
    Inherits webenrolmentcontrolvalidate

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

    Protected Overrides Sub OnLoad(ByVal e As System.EventArgs)
        MyBase.OnLoad(e)

        CourseAction = "Enrol"

        Search = Request.QueryString("Search")
        If Not IsPostBack Then
            If Len(Search) > 0 Then
                SearchDept1.Value = Search
                SearchDept2.Value = Search
            End If
        End If

        If OfferingID() > 0 Then
            OfferingRow = OfferingDataTable.FetchByOfferingID(OfferingID())

            If Not IsNothing(OfferingRow) Then
                CourseFee = OfferingFeeDataTableAdapter.GetOfferingFeeRow(CInt(OfferingRow.OfferingID), 1, 0)
            Else
                CourseFee = Nothing
            End If

            'Another bug where aim title is not available in toolkit so get from other system
            Try
                Course = GetProSolutionData.GetCourseByCode(OfferingRow.Code)
            Catch ex As Exception

            End Try

            Session("RequestMode") = RequestMode.EnrolmentRequest


            If Not IsPostBack Then

                PutAllOfferingsInBasket()
                PopulateOfferingFeeTable()


            Else

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

        Dim intOfferingID As Integer = Me.OfferingID
        If intOfferingID <> -1 Then

            'Dim tblOffering As New OfferingDataTable
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
            Dim tblOffering As New OfferingDataTable
            Dim vOffering As CCCDataViewDataSet = CCCDataViewDataSet.CreateDataViewDefault(tblOffering)
            vOffering.Columns.AddPKColumns()
            vOffering.Columns.EnsureColumnsAreSelected(True, False, tblOffering.CodeColumn, tblOffering.StartTimeColumn, tblOffering.DayOfWeekColumn, tblOffering.StartDateColumn, tblOffering.EndDateColumn, tblOffering.SiteDescriptionColumn, tblOffering.EndTimeColumn, tblOffering.TotalFeeAmountColumn, tblOffering.SIDColumn, tblOffering.WebSiteAvailabilityIDColumn, tblOffering.CourseInformationColumn, tblOffering.GrossTuitionFeeOverrideColumn)
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
